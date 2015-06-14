angular
	.module('mymeanjs', [

		# external modules
		'ngRoute'
		'ngResource'
		'ui.bootstrap'
		'restangular'
		'angular-md5'
		'ngCookies'
		'pascalprecht.translate'
		'ngToast'

		# local modules
		# 'app.header' # Deprecated, bad idea !, delegate all in MainController
		'module.home'
		'module.dummy'
		'module.main'
		'module.profiles'
		'module.news'
		'module.messages'
		'module.controlpanel'
		'module.myoffers'
		'module.account'
		'module.favourites'
		'module.about'
		'module.care'
		'module.team'
		'module.parentswork'
		'module.dependencies'
		'module.contact'

		]).config([
			'$routeProvider'
			'$locationProvider'
			'RestangularProvider'
			'$translateProvider'
			'ngToastProvider'
			( $rp, $lp, RestangularProvider, $translateProvider, ngToast ) ->

				routeRoleChecks = {
					admin:{
						auth:
							(AppUserFactory) ->
								AppUserFactory.isAuthorized('admin')
					}
					authenticated_user: {
						auth:
							(AppUserFactory) ->
								AppUserFactory.isAuthorized('authenticated_user')
					}
				}

				$rp
					.when '/',
						templateUrl: '/partials/app/modules/home/home.html'
						controller: 'HomeCtrl'

					.when '/about',
						templateUrl: '/partials/app/modules/about/about.html'
						controller: 'AboutCtrl'

					.when '/care',
						templateUrl: '/partials/app/modules/care/care.html'
						controller: 'CareCtrl'

					.when '/team',
						templateUrl: '/partials/app/modules/team/team.html'
						controller: 'TeamCtrl'

					.when '/parent',
						templateUrl: '/partials/app/modules/parentswork/parentswork.html'
						controller: 'ParentsWorkCtrl'

					.when '/dependencies',
						templateUrl: '/partials/app/modules/dependencies/dependencies.html'
						controller: 'DependenciesCtrl'	

					.when '/contact',
						templateUrl: '/partials/app/modules/contact/contact.html'
						controller: 'ContactCtrl'

					# logged in user routes
					.when '/news',
						templateUrl: '/partials/app/modules/news/news.html'
						controller: 'NewsCtrl'
						resolve: {
							roles: ()->
								routeRoleChecks.authenticated_user
						}

					.when '/messages',
						templateUrl: '/partials/app/modules/messages/messages.html'
						controller: 'MessagesCtrl'
						resolve: routeRoleChecks.authenticated_user

					.when '/controlpanel',
						templateUrl: '/partials/app/modules/controlpanel/controlpanel.html'
						controller: 'ControlpanelCtrl'
						resolve: routeRoleChecks.authenticated_user

					.when '/myoffers',
						templateUrl: '/partials/app/modules/myoffers/myoffers.html'
						controller: 'MyOffersCtrl'
						resolve: routeRoleChecks.authenticated_user

					.when '/profile/:id/',
						templateUrl: '/partials/app/modules/profiles/profile.html'
						controller: 'ProfilesCtrl'
						resolve: {
							roles: ()->
								routeRoleChecks.authenticated_user

							userProfile: [
								'$route'
								'ProfilesSrvc'
								($route, ProfilesSrvc) ->
									console.log("resolving : " + $route.current.params.id)
									p = ProfilesSrvc.getProfile($route.current.params.id)
									console.log p
									return p
							]
						}

					.when '/account',
						templateUrl: '/partials/app/modules/account/account.html'
						controller: 'AccountCtrl'
						resolve: routeRoleChecks.authenticated_user

					.when '/favourites',
						templateUrl: '/partials/app/modules/favourites/favourites.html'
						controller: 'FavouritesCtrl'
						resolve: routeRoleChecks.authenticated_user

					.otherwise
						redirectTo: '/'

				$lp.html5Mode({
					enabled: true
					requireBase: true
				})

				$lp.hashPrefix( '!' )

				# restangular base api url
				RestangularProvider.setBaseUrl('http://localhost:3030/')

				# add interceptor to set auth JWT token if exists
				#RestangularProvider.addFullRequestInterceptor( ( headers, params, element, httpConfig, $window ) ->
				#	console.log($window.sessionStorage)
				#	if $window.sessionStorage? and $window.sessionStorage.user.token?
				#		headers.Authorization = 'Bearer ' + $window.sessionStorage.user.token
				#		return headers
				#)

				if sessionStorage.currentSession?
					RestangularProvider.setDefaultHeaders( { Authorization:  'Bearer ' + sessionStorage.currentSession.token || {} });

				# angular-translate
				# determine autimatically language via content-negotiation
				#$translateProvider.determinePreferredLanguage()
				$translateProvider.useUrlLoader('/public_services/i18n')
				$translateProvider.preferredLanguage('en_GB')
				$translateProvider.fallbackLanguage('en_GB')
				$translateProvider.usePostCompiling(true)
				$translateProvider.useLocalStorage()

				# toast
				ngToast.configure({
					verticalPosition: 'top'
					horizontalPosition: 'right'
					animation: 'fade'
					dismissButton: true
					maxNumber: 3
				})

		]).run(
			( $rootScope, $location, SystemMessages ) ->
				$rootScope.$on('$routeChangeError', (evt, current, previous, rejection) ->
					console.log('$routeChangeError')
					if rejection is 'not authorized'
						SystemMessages.warning('not authorized')
						return $location.path('/')
					else
						SystemMessages.warning(rejection.statusText + ' ' + rejection.data.error)
						console.log(rejection)
						return $location.path('/')
				)
	)

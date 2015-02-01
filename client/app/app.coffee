angular
	.module('mymeanjs', [

		# external modules
		'ngRoute'
		'ui.bootstrap'
		'restangular'
		'angular-md5'

		# local modules
		# 'app.header' # Deprecated, bad idea !, delegate all in MainController
		'module.dummy'
		'module.main'
		'module.profiles'
		'module.messages'
		'module.controlpanel'
		'module.myoffers'
		'module.account'
		'module.favourites'
		'module.about'
		'module.contact'

		]).config([
			'$routeProvider'
			'$locationProvider'
			'RestangularProvider'
			( $rp, $lp, restAngularProvider ) ->

				$rp
					.when '/',
						templateUrl: '/partials/app/templates/dummy.html'
						controller: 'DummyCtrl'

					.when '/messages',
						templateUrl: '/partials/app/modules/messages/messages.html'
						controller: 'MessagesCtrl'

					.when '/controlpanel',
						templateUrl: '/partials/app/modules/controlpanel/controlpanel.html'
						controller: 'ControlpanelCtrl'

					.when '/myoffers',
						templateUrl: '/partials/app/modules/myoffers/myoffers.html'
						controller: 'MyOffersCtrl'

					.when '/profile/:id/',
						templateUrl: '/partials/app/modules/profiles/profile.html'
						controller: 'ProfilesCtrl'
						resolve:
							userProfile: [
								'$route'
								'ProfilesSrvc'
								($route, ProfilesSrvc) ->
									console.log("resolving : " + $route.current.params.id)
									return ProfilesSrvc.getProfile( $route.current.params.id )
							]


					.when '/account',
						templateUrl: '/partials/app/modules/account/account.html'
						controller: 'AccountCtrl'

					.when '/favourites',
						templateUrl: '/partials/app/modules/favourites/favourites.html'
						controller: 'FavouritesCtrl'

					.when '/about',
						templateUrl: '/partials/app/modules/about/about.html'
						controller: 'AboutCtrl'

					.when '/contact',
						templateUrl: '/partials/app/modules/contact/contact.html'
						controller: 'ContactCtrl'

					.otherwise
						redirectTo: '/'

				$lp.html5Mode({
					enabled: true,
					requireBase: true
				})

				$lp.hashPrefix( '!' )

				# restangular base api url
				restAngularProvider.setBaseUrl('http://localhost:3030/')

		]).run(
			( $rootScope ) ->
				console.log "app run"

				#######################################################
				#
				# Check session saved in session storage
				# TODO: enable restore session in backend via cookie?
				#
				#######################################################
				#console.log "sessionStorage.currentSession"
				#console.log sessionStorage.currentSession
				if sessionStorage.currentSession?
					window.bootstrappedUserObject = angular.fromJson(sessionStorage.currentSession)
					# let everything know that we need to restore session now.
					window.onload = ( ) ->
						#console.log "on load"
						$rootScope.$broadcast('initSessionEvent', angular.fromJson(sessionStorage.currentSession) )
	)

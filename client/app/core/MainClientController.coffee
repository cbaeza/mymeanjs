# MainController for client
# Responsible of:
#		handler sessions, languages, register
#
angular
	.module('mymeanjs')
	.controller('MainClientController', [
		'$scope'
		'$location'
		'$modal'
		'AuthenticatorSrvc'
		'$rootScope'
		'$cookies'
		'$translate'
		'Restangular'
		'AppUserFactory'
		'SystemMessages'
		'$window'
		'SessionMgmt'

		( $scope, location, $modal, AuthenticatorSrvc, $rootScope, $cookies, $translate,
			Restangular, AppUserFactory, SystemMessages, $window, SessionMgmt) ->

			# console.log('MainClientController init')
			# console.log(AppUserFactory.currentUser)

			# system messages in header
			$scope.system = {
				message : ''
			}

			#######################################################
			#
			# Session
			#
			#######################################################

			# user
			$scope.user = {
				_id: null
				name: null
				lastname: null
				email: null
				password: null
				lastLogin: null
				roles:null
				isAuthenticated: false
				token: null
			}

			# toogle flag to open/close menu
			$scope.status = {
				isopen: false
				isLanguageOpen: false
			}

			# remember me, currently based on session storage
			if AppUserFactory.currentUser?
				console.log('Restoring session !')
				SessionMgmt.rememberMe()
				$scope.user = SessionMgmt.user
				$scope.system.message = "{ #{$scope.user.name} #{$scope.user.lastname} }"

			# init user data after success sign in	
			$scope.$on('signInEvent', ( event, data) ->
				console.log  'onSigIn'
				#console.log  data
				$scope.user = SessionMgmt.user
				console.log $scope.user
				$scope.system.message = "{ #{$scope.user.name} #{$scope.user.lastname} }"

				delete $scope.user.password
				SystemMessages.info('Logged in as ' + $scope.user.email )
			)

			$scope.logout = ( event ) ->
				AuthenticatorSrvc.logout($scope.user).then (
					( data ) ->
						console.log data
						SessionMgmt.destroySession()
						$scope.user.isAuthenticated = false
						$scope.system.message = ""
						location.path('/')
				)

			#######################################################
			#
			# Register
			#
			#######################################################
			$scope.signUp = ( event ) ->
				console.log( 'signUp')
				event.preventDefault()
				event.stopPropagation()
				$modal.open({
					controller: 'RegisterModalCtrl'
					templateUrl: '/partials/app/templates/register.html'

				}).result.then (data) ->
					console.log data

			#######################################################
			#
			# Sign in
			#
			#######################################################
			$scope.openSignInDialog = ( event ) ->
				console.log( 'sign in')
				event.preventDefault()
				event.stopPropagation()
				$modal.open({
					controller: 'SignInModalCtrl'
					templateUrl: '/partials/app/templates/signin.html'

				}).result.then (data) ->
					console.log data

			#######################################################
			#
			# Languages
			#
			#######################################################

			$scope.providers = {
				languages: [
					{ key:"de_DE", flag:"de", text: "Deutsch", },
					{ key:"en_GB", flag:"gb", text: "English"},
					{ key:"es_ES", flag:"es", text: "Español"},
				]
			}

			$scope.status = {
				isLanguageOpen: false
			}

			# default lang if not found previous selected lang in local storage
			$scope.lang = $scope.providers.languages[1]

			if( localStorage.NG_TRANSLATE_LANG_KEY? )  
				# console.log localStorage.NG_TRANSLATE_LANG_KEY
				selectedKey = localStorage.NG_TRANSLATE_LANG_KEY
				angular.forEach( $scope.providers.languages, ( lang ) ->
					#console.log(lang)
					if lang.key  is selectedKey 
						$scope.lang = lang
				)

			$scope.useLang = ( lang ) ->
				console.log( lang )
				$translate.use( lang.key )
				$cookies.lang = lang.key
				$scope.lang = lang

			$scope.getLangCss = ( lang ) ->
				#console.log( lang )
				return "flag-icon-#{lang}"

	])
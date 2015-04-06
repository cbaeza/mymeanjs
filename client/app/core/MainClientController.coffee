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

		( $scope, location, $modal, AuthenticatorSrvc, $rootScope, $cookies, $translate, Restangular, AppUserFactory) ->

			console.log('MainClientController init')
			console.log(AppUserFactory.currentUser)

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
				isAuthenticated: false
			}

			# toogle flag to open/close menu
			$scope.status = {
				isopen: false
			}

			# wrap user data to be storage in sessionStorage and windows
			initSession = ( sessionData ) ->
				#console.log "on restoreSession"
				#console.log sessionData.user
				#console.log sessionData.token
				$scope.user._id             = sessionData.user._id
				$scope.user.name            = sessionData.user.name
				$scope.user.lastname        = sessionData.user.lastname
				$scope.user.email           = sessionData.user.email
				$scope.user.isAuthenticated = true
				$scope.user.lastLogin       = new Date()
				delete $scope.user.password
				# refresh user
				window.bootstrappedUserObject 	= $scope.user

				$scope.system.message 			= "{ #{$scope.user.name} #{$scope.user.lastname} }"

				Restangular.setDefaultHeaders( { Authorization:  'Bearer ' + sessionStorage.token || {} })
				console.log("token updated " + sessionStorage.token)

			#######################################################
			#
			# Check session storage and session token
			#
			#######################################################
			if AppUserFactory.currentUser?
				initSession( AppUserFactory.currentUser )

			$scope.authenticate = ( event ) ->
				AuthenticatorSrvc.login($scope.user).then(

					( data ) ->
						#console.log(data)
						initSession( data )
						# save session after successfully login
						sessionStorage.currentSession 	= angular.toJson($scope.user)
						sessionStorage.token 			= data.token

					( error ) ->
						console.log error
						if( error? )
							console.log 'error'
							$scope.system.message = error.data.error
				)

			$scope.logout = ( event ) ->
				AuthenticatorSrvc.logout($scope.user).then (
					( data ) ->
						console.log data
						$scope.user.isAuthenticated = false
						window.bootstrappedUserObject = null
						delete sessionStorage.currentSession
						delete sessionStorage.token
						$scope.system.message = ""
						location.path('/')
				)

			#######################################################
			#
			# Register
			#
			#######################################################
			$scope.register = ( event ) ->
				console.log( 'register')
				event.preventDefault()
				event.stopPropagation()
				$modal.open({
					controller: 'RegisterModalCtrl'
					templateUrl: '/partials/app/templates/register.html'

				}).result.then (data) ->
					console.log data


			#######################################################
			#
			# Languages
			#
			#######################################################

			# languages
			$scope.providers = {
				languages: [
					{ key:"de_DE", flag:"de", text: "Deutsch", },
					{ key:"en_GB", flag:"gb", text: "English"},
					{ key:"es_ES", flag:"es", text: "Español"},
				]
			}

			# lang
			$scope.langDropDown = false
			$scope.lang = $scope.providers.languages[1]

			if( localStorage.NG_TRANSLATE_LANG_KEY? )  
				# console.log localStorage.NG_TRANSLATE_LANG_KEY
				selectedKey = localStorage.NG_TRANSLATE_LANG_KEY
				angular.forEach( $scope.providers.languages, ( lang ) ->
					#console.log(lang)
					if lang.key  is selectedKey 
						$scope.lang = lang
				)


			# menu for logged in user
			$scope.toggleDropdown = (event) ->
				event.preventDefault()
				event.stopPropagation()
				$scope.status.isopen = !$scope.status.isopen
				
			$scope.useLang = ( event, lang ) ->
				console.log( lang )
				event.preventDefault()
				event.stopPropagation()

				$translate.use( lang.key )
				$cookies.lang = lang.key
				$scope.langDropDown = false
				$scope.lang = lang

			$scope.getLangCss = ( lang ) ->
				#console.log( lang )
				return "flag-icon-#{lang}"

	])
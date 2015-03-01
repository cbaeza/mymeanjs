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

		( $scope, location, $modal, AuthenticatorSrvc, $rootScope, $cookies ) ->

			console.log('MainClientController init')

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

			# triggered on load document and if exist a user session on session storage
			$rootScope.$on("initSessionEvent", ( event, currentSessionData, token ) ->
				sessionData = {}
				sessionData.user = currentSessionData
				sessionData.token = token
				initSession( sessionData )
			)

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
				sessionStorage.token 			= sessionData.token
				$scope.system.message 			= "| #{$scope.user.name} #{$scope.user.lastname}"


			$scope.authenticate = ( $event ) ->
				AuthenticatorSrvc.login($scope.user).then(

					( data ) ->
						#console.log(data)
						initSession( data )
						# save session after successfully login
						sessionStorage.currentSession = angular.toJson($scope.user)

					( error ) ->
						console.log error
						if( error? )
							console.log 'error'
							$scope.system.message = error.data.error
				)

			$scope.logout = ( $event ) ->
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
			$scope.register = ( $event ) ->
				console.log( 'register')
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
				languages: ["es", "gb", "ga"]
			}

			# lang
			$scope.langDropDown = false

			# menu for logged in user
			$scope.toggleDropdown = ($event) ->
				$event.preventDefault()
				$event.stopPropagation()
				$scope.status.isopen = !$scope.status.isopen
				
			$scope.useLang = ( $event, lang ) ->
				#console.log( lang )

			$scope.getLangCss = ( lang ) ->
				#console.log( lang )
				return "flag-icon-#{lang}"

	])
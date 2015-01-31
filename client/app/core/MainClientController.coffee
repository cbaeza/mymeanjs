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
		( $scope, location, $modal, AuthenticatorSrvc, $rootScope ) ->

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
				creationDate: null
				registeredUser: false
			}

			# toogle flag to open/close menu
			$scope.status = {
				isopen: false
			}

			# triggered on load document and if exist a user session on session storage
			$rootScope.$on("initSessionEvent", ( event, currentSessionData ) ->
				#console.log "initSessionEvent listener"
				#console.log currentSessionData
				# TODO: auth in backend by cookie
				# initSession( currentSessionData )
			)

			# wrap user data to be storage in sessionStorage and windows
			initSession = ( sessionData ) ->
				#console.log "on restoreSession"
				console.log sessionData
				$scope.user._id             = sessionData._id
				$scope.user.name            = sessionData.name
				$scope.user.lastname        = sessionData.lastname
				$scope.user.email           = sessionData.email
				$scope.user.creationDate    = sessionData.creationDate
				$scope.user.registeredUser  = true
				$scope.user.lastLogin       = new Date()
				delete $scope.user.password
				# refresh user
				window.bootstrappedUserObject = $scope.user
				$scope.system.message = "| #{$scope.user.name} #{$scope.user.lastname}"


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
						#console.log('logout done')
						console.log data
						$scope.user.registeredUser = false
						window.bootstrappedUserObject = null
						delete sessionStorage.currentSession
						location.path('/')
				)

			$scope.register = ( $event ) ->
				console.log( 'register')
				$modal.open({
					controller: 'RegisterModalCtrl'
					templateUrl: '/partials/app/templates/register.html'

				}).result.then (data) ->
					console.log data

			# menu for logged in user
			$scope.toggleDropdown = ($event) ->
				$event.preventDefault()
				$event.stopPropagation()
				$scope.status.isopen = !$scope.status.isopen

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

			$scope.useLang = ( $event, lang ) ->
				#console.log( lang )

			$scope.getLangCss = ( lang ) ->
				#console.log( lang )
				return "flag-icon-#{lang}"

	])
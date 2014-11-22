# MainController for client
# Responsible of:
#		handler authentication for users
#
angular
	.module('mymeanjs')
	.controller('MainClientController', [
		'$scope'
		'$location'
		'$modal'
		'ngDialog'
		'AuthenticatorSrvc'
		( $scope, location, $modal, ngDialog, AuthenticatorSrvc ) ->
			console.log('MainClientController init')

			$scope.user = {
				email: null
				password: null
				loggedOn: Date.now()
				registeredUser: false
			}

			$scope.system = {
				message : ''
			}

			$scope.authenticate = ( event ) ->
				#console.log("authenticate MainClientController: "+ JSON.stringify($scope.user) )
				AuthenticatorSrvc.login($scope.user).then(

					( data ) ->
						console.log data
						$scope.user.registeredUser = true
						window.bootstrappedUserObject = data
						$scope.system.message = "| #{data.name} #{data.lastname}"

					( error ) ->
						console.log error
						if( error? )
							# ngDialog.open({  template: "<p>Error #{error}</p>", plain: true })
							console.log 'en error'
							$scope.system.message = error.data.error
				)

			$scope.logout = ( event ) ->
				AuthenticatorSrvc.logout($scope.user).then (
					( data ) ->
						#console.log('logout done')
						console.log data
						$scope.user.registeredUser = false
						window.bootstrappedUserObject = null
						location.path('/')
				)

			$scope.register = ( event ) ->
				console.log( 'register')
				$modal.open({
					controller: 'RegisterModalCtrl'
					templateUrl: '/partials/app/templates/register.html'

				}).result.then (data) ->
					console.log data


	])
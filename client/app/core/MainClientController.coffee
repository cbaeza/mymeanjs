# MainController for client
# Responsible of:
#		handler authentication for users
#
angular
	.module('mymeanjs')
	.controller('MainClientController', [
		'$scope'
		'$location'
		'AuthenticatorSrvc'
		( $scope, location, AuthenticatorSrvc ) ->
			console.log('MainClientController init')

			$scope.user = {
				email: null
				password: null
				loggedOn: Date.now()
				registeredUser: false
			}

			$scope.authenticate = ( event ) ->
				#console.log("authenticate MainClientController: "+ JSON.stringify($scope.user) )
				AuthenticatorSrvc.login($scope.user).then (
					( data ) ->
						console.log data
						$scope.user.registeredUser = true
						window.bootstrappedUserObject = data
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


	])
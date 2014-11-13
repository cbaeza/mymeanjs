# MainController for client
# Responsible of:
#		handler authentication for users
#
angular
	.module('mymeanjs')
	.controller('MainClientController', [
		'$scope'
		'AuthenticatorSrvc'
		( $scope, AuthenticatorSrvc ) ->
			console.log('MainClientController init')

			$scope.user = {
				useremail: null
				password: null
				loggedOn: Date.now()
				registeredUser: false
			}

			$scope.authenticate = ( event ) ->
				#console.log("authenticate MainClientController: "+ JSON.stringify($scope.user) )
				AuthenticatorSrvc.authenticate($scope.user)
				$scope.user.registeredUser = true

	])
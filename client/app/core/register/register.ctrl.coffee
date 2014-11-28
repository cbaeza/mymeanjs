
# RegisterModalCtrl for client
# Responsible of:
#		handler registration for new users
#
angular
	.module('mymeanjs')
	.controller('RegisterModalCtrl', [
			'$scope'
			'$location'
			'$modal'
			'AuthenticatorSrvc'
			'$modalInstance'
			( $scope, location, modal, AuthenticatorSrvc, $modalInstance ) ->
				console.log('RegisterModalCtrl init')

				$scope.newUser = {
					name: null
					lastname: null
					email: null
					password1: null
					password2: null
				}

				$scope.doRegister = ( event ) ->
					console.log('do Register')
					console.log $scope.newUser

				$scope.close = ( event ) ->
					console.log('do Register')
					$modalInstance.dismiss('cancel')
	])
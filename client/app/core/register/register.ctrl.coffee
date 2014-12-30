
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
			'RegisterSrvc'
			'$modalInstance'
			( $scope, location, modal, RegisterSrvc, $modalInstance ) ->
				console.log('RegisterModalCtrl init')

				$scope.newUser = {
					name: null
					lastname: null
					email: null
					password: null
					password2: null
				}
				$scope.isRegister = false

				$scope.doRegister = ( event ) ->
					console.log('do Register')
					console.log $scope.newUser
					RegisterSrvc.registerUser( $scope.newUser ).then(
						( data ) ->
							console.log "register done"
							$scope.isRegister = true
					)

				$scope.close = ( event ) ->
					console.log('do Register')
					$modalInstance.dismiss('cancel')
	])

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

				$scope.doRegister = ( event ) ->
					console.log('do Register')

				$scope.close = ( event ) ->
					console.log('do Register')
					$modalInstance.dismiss('cancel')
	])
angular
	.module('module.account.controller', ['module.account.service'])
	.controller('AccountCtrl', [
		'$scope'
		'AccountSrvc'
		( $scope, accountSrvc ) ->

			console.log 'AccountCtrl init'

			accountSrvc.sayHello()

			$scope.status = "ready to go from AccountCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from AccountCtrl controller!"
	])

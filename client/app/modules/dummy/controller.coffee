angular
	.module('module.dummy.controller', ['module.dummy.service']).controller('DummyCtrl', [
		'$scope'
		'DummySrvc'
		( $scope, dummySrvc ) ->
			console.log 'DummyCtrl init'

			dummySrvc.sayHello()

			$scope.status = "ready to go from DummyCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from DummyCtrl controller!"
	])

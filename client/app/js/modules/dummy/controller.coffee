angular.module('module.dummy.controller').controller('DummyCtrl', [
	'$scope'
	'DummySrvc'
	( $scope, dummySrvc ) ->
		console.log 'DummyCtrl init'

		$scope.sayHello = ( )->
			return "hello from controller !"
])

angular
	.module('module.care.controller', ['module.care.service'])
	.controller('CareCtrl', [
		'$scope'
		'CareSrvc'
		( $scope, careSrvc ) ->

			$scope.status = "ready to go from CareCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from CareCtrl controller!"
	])

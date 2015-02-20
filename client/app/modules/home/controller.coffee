angular
	.module('module.home.controller', ['module.home.service']).controller('HomeCtrl', [
		'$scope'
		'HomeSrvc'
		( $scope, homeSrvc ) ->

			$scope.buttonMessage = "Go"
			$scope.status = "ready to go from HomeCtrl controller!"

			$scope.sayHello = ( ) ->
				return "hello from HomeCtrl controller!"
	])

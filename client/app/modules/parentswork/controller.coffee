angular
	.module('module.parentswork.controller', ['module.parentswork.service'])
	.controller('ParentsWorkCtrl', [
		'$scope'
		'ParentsWorkSrvc'
		( $scope, parentsWorkSrvc ) ->

			$scope.status = "ready to go from ParentsWorkCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from ParentsWorkCtrl controller!"
	])

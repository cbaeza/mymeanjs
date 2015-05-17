angular
	.module('module.team.controller', ['module.team.service'])
	.controller('TeamCtrl', [
		'$scope'
		'TeamSrvc'
		( $scope, teamrvc ) ->

			$scope.status = "ready to go from TeamCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from TeamCtrl controller!"
	])

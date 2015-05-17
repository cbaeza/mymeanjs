angular
	.module('module.dependencies.controller', ['module.dependencies.service'])
	.controller('DependenciesCtrl', [
		'$scope'
		'DependenciesSrvc'
		( $scope, dependenciesSrvc ) ->

			$scope.status = "ready to go from DependenciesCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from DependenciesCtrl controller!"
	])

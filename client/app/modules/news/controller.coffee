angular
	.module('module.news.controller', ['module.news.service']).controller('NewsCtrl', [
		'$scope'
		'NewsSrvc'
		( $scope, newsSrvc ) ->

			newsSrvc.sayHello()

			$scope.status = "ready to go from NewsCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from NewsCtrl controller!"
	])

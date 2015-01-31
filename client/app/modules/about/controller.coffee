angular
	.module('module.about.controller', ['module.about.service']).controller('AboutCtrl', [
		'$scope'
		'AboutSrvc'
		( $scope, aboutSrvc ) ->
			console.log 'AboutCtrl init'

			aboutSrvc.sayHello()

			$scope.status = "ready to go from AboutCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from AboutCtrl controller!"
	])

angular('module.main.controller', ['module.main.service']).controller('MainCtrl', [
	'$scope'
	'MainSrvc'
	( $scope, mainService ) ->
		console.log 'MainCtrl init'

		$scope.status = "ready to go from Main controller!"
		$scope.sayHello = ( ) ->
			return "hello from Main controller!"
])
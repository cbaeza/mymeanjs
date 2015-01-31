angular
	.module('module.contact.controller', ['module.contact.service']).controller('ContactCtrl', [
		'$scope'
		'ContactSrvc'
		( $scope, contactSrvc ) ->
			console.log 'ContactCtrl init'

			#contactSrvc.sayHello()

			$scope.status = "ready to go from ContactCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from ContactCtrl controller!"
	])

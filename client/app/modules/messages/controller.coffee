angular
	.module('module.messages.controller', ['module.messages.service'])
	.controller('MessagesCtrl', [
		'$scope'
		'MessagesSrvc'
		( $scope, messagesSrvc ) ->
			console.log 'MessagesCtrl init'

			messagesSrvc.sayHello()

			$scope.status = "ready to go from MessagesCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from MessagesCtrl controller!"
	])

angular
	.module('module.controlpanel.controller', ['module.controlpanel.service'])
	.controller('ControlpanelCtrl', [
		'$scope'
		'ControlPanelSrvc'
		( $scope, controlPanelSrvc ) ->

			console.log 'ControlpanelCtrl init'

			controlPanelSrvc.sayHello()

			$scope.status = "ready to go from ControlpanelCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from ControlpanelCtrl controller!"
	])

angular
	.module('module.controlpanel.service', [])
	.service( 'ControlPanelSrvc', [
		'Restangular'
		( Restangular ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

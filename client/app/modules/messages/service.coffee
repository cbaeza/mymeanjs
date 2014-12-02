angular
	.module('module.messages.service', [])
	.service( 'MessagesSrvc', [
		'Restangular'
		( Restangular ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

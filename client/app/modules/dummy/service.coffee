angular
	.module('module.dummy.service', []).service( 'DummySrvc', [
		'Restangular'
		( Restangular ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

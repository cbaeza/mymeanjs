angular
	.module('module.care.service', [])
	.service( 'CareSrvc', [
		'Restangular'
		( Restangular ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

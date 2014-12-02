angular
	.module('module.main.service', []).service( 'MainSrvc', [
		'Restangular'
		( Restangular ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

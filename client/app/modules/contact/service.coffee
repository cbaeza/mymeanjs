angular
	.module('module.contact.service', []).service( 'ContactSrvc', [
		'Restangular'
		( Restangular ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

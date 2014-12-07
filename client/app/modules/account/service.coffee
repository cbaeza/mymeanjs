angular
	.module('module.account.service', [])
	.service( 'AccountSrvc', [
		'Restangular'
		( ra ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

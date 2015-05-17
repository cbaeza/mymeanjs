angular
	.module('module.team.service', [])
	.service( 'TeamSrvc', [
		'Restangular'
		( Restangular ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

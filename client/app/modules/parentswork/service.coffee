angular
	.module('module.parentswork.service', [])
	.service( 'ParentsWorkSrvc', [
		'Restangular'
		( Restangular ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

angular
	.module('module.dependencies.service', [])
	.service( 'DependenciesSrvc', [
		'Restangular'
		( Restangular ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

angular
	.module('module.messages.service', [])
	.service( 'MessagesSrvc', [
		'$q'
		'$http'
		( $q, $http ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

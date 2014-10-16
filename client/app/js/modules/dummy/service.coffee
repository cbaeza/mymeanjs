angular.module('module.dummy.service', []).service( 'DummySrvc', [
	'$q'
	'$http'
	( $q, $http ) ->

		@sayHello = () ->
			console.log "service say hello!"

		return
])

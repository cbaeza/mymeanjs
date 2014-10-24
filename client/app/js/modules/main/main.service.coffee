angular.module('module.main.service', []).service( 'MainSrvc', [
	'$q'
	'$http'
	( $q, $http ) ->

		@sayHello = () ->
			console.log "service say hello!"

		return
])

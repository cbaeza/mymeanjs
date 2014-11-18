angular.module('module.profiles.service', []).service( 'ProfilesSrvc', [
	'Restangular'
	( ra ) ->

		@sayHello = () ->
			console.log "ProfilesSrvc say hello!"

		return
])

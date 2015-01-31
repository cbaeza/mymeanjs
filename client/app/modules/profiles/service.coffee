angular
	.module('module.profiles.service', [])
	.service( 'ProfilesSrvc', [
		'Restangular'
		( Restangular ) ->

			baseProfileUrl = Restangular.all('api/v1/profile')

			@sayHello = () ->
				console.log "ProfilesSrvc say hello!"

			@getProfile = ( id ) ->
				return baseProfileUrl.get(id);

			return
	])

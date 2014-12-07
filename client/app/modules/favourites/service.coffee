angular
	.module('module.favourites.service', [])
	.service( 'FavouritesSrvc', [
		'Restangular'
		( ra ) ->

			@sayHello = () ->
				console.log "service say hello!"

			return
	])

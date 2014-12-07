angular
	.module('module.myoffers.service', [])
	.service( 'MyOffersSrvc', [
		'Restangular'
		( ra ) ->

			@sayHello = () ->
				console.log "MyOffersSrvc say hello!"

			return
	])

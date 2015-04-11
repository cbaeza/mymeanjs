angular
	.module('mymeanjs')
	.service( 'SystemMessages', [
		'ngToast'
		( ngToast ) ->

			@success = ( msg ) ->
				ngToast.create({
					className: 'success',
					content: msg
				})

			@info = ( msg ) ->
				ngToast.create({
					className: 'info',
					content: msg
				})

			@warning = ( msg ) ->
				ngToast.create({
					className: 'warning',
					content: msg
				})

			@danger = ( msg ) ->
				ngToast.create({
					className: 'danger',
					content: msg
				})

			return

	])

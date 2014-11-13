angular
	.module('mymeanjs')
	.service('AuthenticatorSrvc', [
		'$q'
		'Restangular'
		( $q, ra ) ->

			console.log('AuthenticatorSrvc init')

			@authenticate = ( user ) ->
				console.log(user)


			return
	])
angular
	.module('mymeanjs')
	.service('AuthenticatorSrvc', [
		'$q'
		( $q ) ->
			console.log('AuthenticatorSrvc init')

			@authenticate = ( user ) ->
				console.log(user)


			return
	])
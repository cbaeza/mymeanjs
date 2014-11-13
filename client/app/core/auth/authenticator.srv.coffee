angular
	.module('mymeanjs')
	.service('AuthenticatorSrvc', [
		'$q'
		'Restangular'
		( $q, ra ) ->

			console.log('AuthenticatorSrvc init')

			baseUsersUrl = ra.all('users')

			@authenticate = ( user ) ->
				# console.log(user)
				baseUsersUrl.getList().then ( users ) ->
					console.log users


			return
	])
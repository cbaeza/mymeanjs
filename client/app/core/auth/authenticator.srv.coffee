angular
	.module('mymeanjs')
	.service('AuthenticatorSrvc', [
		'$q'
		'md5'
		'Restangular'
		( $q, md5, ra ) ->

			console.log('AuthenticatorSrvc init')

			baseUsersUrl = ra.all('users')

			@authenticate = ( user ) ->
				# console.log(user)
				service = baseUsersUrl.all('authenticate')
				user.password = md5.createHash( user.password )
				return service.post(user)

			@getAllUsers = -> return baseUsersUrl.getList()

			return
	])
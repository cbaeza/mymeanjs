angular
	.module('mymeanjs')
	.service('AuthenticatorSrvc', [
		'$q'
		'md5'
		'Restangular'
		( $q, md5, Restangular ) ->

			console.log('AuthenticatorSrvc init')

			baseUsersUrl = Restangular.all('auth')

			@login = ( user ) ->
				# console.log(user)
				service = baseUsersUrl.all('login')
				if user.password?
					user.password = md5.createHash( user.password )
					return service.post(user)

			@logout = ( user ) ->
				service = baseUsersUrl.all('logout')
				return service.post(user)

			@getAllUsers = () ->
				return baseUsersUrl.getList()

			return
	])
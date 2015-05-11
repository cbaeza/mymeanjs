angular
angular
	.module('mymeanjs')
	.service( 'RegisterSrvc', [
		'Restangular'
		( Restangular ) ->

			baseUsersUrl = Restangular.all('auth/accounts')

			@registerUser = ( user ) ->
				console.log "registering user..."
				newUser = {
					name: user.name
					lastname: user.lastname
					email: user.email
					password: user.password
				}
				console.log newUser
				# POST /accounts
				return baseUsersUrl.post(newUser)

			return

	])

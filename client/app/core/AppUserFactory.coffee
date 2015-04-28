angular
	.module('mymeanjs')
	.factory( 'AppUserFactory', [
		'$rootScope'
		'$window'
		'$q'
		( $rootScope, $window, $q ) ->

			c = @
			c.currentUser = null

			if $window.bootstrappedUserObject?
				c.currentUser = angular.fromJson($window.bootstrappedUserObject)

			else
				# remember me
				if sessionStorage.currentSession?
					c.currentUser = angular.fromJson(sessionStorage.currentSession)


			return {
				currentUser: c.currentUser
				token: c.currentUser?.token
				isAuthenticated: -> return c.currentUser?
				isAuthorized: ( role ) ->
					console.log('isAuthorized: ' + c.currentUser)
					if c.currentUser? && c.currentUser.roles.indexOf(role) > -1
						return true
					else
						return $q.reject('not authorized')
			}
	])

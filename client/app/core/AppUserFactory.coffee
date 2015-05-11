angular
	.module('mymeanjs')
	.factory( 'AppUserFactory', [
		'$rootScope'
		'$window'
		'$q'
		'SessionMgmt'
		( $rootScope, $window, $q, SessionMgmt ) ->

			c = @
			c.currentUser = null

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
					else if SessionMgmt.user? && SessionMgmt.user.roles?.indexOf(role) > -1
						c.currentUser = angular.fromJson(SessionMgmt.user)
						return true
					else	
						return $q.reject('not authorized')

			}
	])

angular
	.module('mymeanjs')
	.factory( 'AppUserFactory', [
		'$rootScope'
		'$window'
		( $rootScope, $window ) ->

			currentUser = undefined

			if sessionStorage.token? and sessionStorage.currentSession?
				currentUser = {}
				currentUser.user = angular.fromJson(sessionStorage.currentSession)

			return {
				currentUser: currentUser
				token: sessionStorage.token
				isAuthenticated: -> return currentUser?
			}
	])

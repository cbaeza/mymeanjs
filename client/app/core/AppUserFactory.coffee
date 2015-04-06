angular
	.module('mymeanjs')
	.factory( 'AppUserFactory', [
		'$rootScope'
		'$window'
		( $rootScope, $window ) ->

			currentUser = undefined
			token = undefined

			if sessionStorage.token? and sessionStorage.currentSession?
				currentUser = {}
				currentUser.user = angular.fromJson(sessionStorage.currentSession)
				token = sessionStorage.token


			return {
				currentUser: currentUser
				token: token
				isAuthenticated: -> return currentUser?
			}
	])

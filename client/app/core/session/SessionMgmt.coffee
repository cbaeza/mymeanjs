angular
	.module('mymeanjs')
	.service( 'SessionMgmt', [
		'$window'
		'AppUserFactory'
		'Restangular'
		( $window, AppUserFactory, Restangular ) ->

			c = @
			c.user = {}

			createSession = ( data ) ->
				c.user._id             = data.user._id
				c.user.name            = data.user.name
				c.user.lastname        = data.user.lastname
				c.user.email           = data.user.email
				c.user.lastLogin       = new Date()
				c.user.roles           = data.user.roles
				c.user.isAuthenticated = true
				c.user.token		   = data.user.token || data.token

				sessionStorage.currentSession = angular.toJson(c.user)

				AppUserFactory.currentUser = angular.fromJson(sessionStorage.currentSession)

				# update rest angular auth header
				Restangular.setDefaultHeaders( { Authorization:  'Bearer ' + c.user.token || {} })

			@initSession = ( data ) ->
				console.log 'init session'
				createSession( data )

			@destroySession = ( ) ->
				console.log 'destroy session'
				c.user = {}
				delete sessionStorage.currentSession

			@rememberMe = ( ) ->
				# read from session storage
				console.log 'restore session'
				data = {}
				data.user = angular.fromJson(sessionStorage.currentSession)

				createSession( data )

			@user = c.user

			return

	])

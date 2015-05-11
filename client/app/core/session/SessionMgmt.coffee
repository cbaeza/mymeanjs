angular
	.module('mymeanjs')
	.service( 'SessionMgmt', [
		'$window'
		'Restangular'
		( $window, Restangular ) ->

			c = @
			c.user = {}

			createSession = ( data, rememberMe ) ->
				c.user._id             = data.user._id
				c.user.name            = data.user.name
				c.user.lastname        = data.user.lastname
				c.user.email           = data.user.email
				c.user.lastLogin       = new Date()
				c.user.roles           = data.user.roles
				c.user.isAuthenticated = true
				c.user.token		   = data.user.token || data.token

				if rememberMe is true
					sessionStorage.currentSession = angular.toJson(c.user)
					
				# update rest angular auth header
				Restangular.setDefaultHeaders( { Authorization:  'Bearer ' + c.user.token || {} })

			@initSession = ( data, rememberMe ) ->
				console.log 'init session'
				createSession( data, rememberMe )

			@destroySession = ( ) ->
				console.log 'destroy session'
				c.user = {}
				delete sessionStorage.currentSession

			@rememberMe = ( ) ->
				# read from session storage
				console.log 'restore session'
				data = {}
				data.user = angular.fromJson(sessionStorage.currentSession)

				createSession( data, true )

			@user = c.user

			return

	])

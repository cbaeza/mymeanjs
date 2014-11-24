angular
	.module('mymeanjs', [

		# external modules
		'ngRoute'
		'ui.bootstrap'
		'restangular'
		'angular-md5'
		'ngDialog'

		# local modules
		# 'app.header' # Deprecated, bad idea !, delegate all in MainController
		'module.dummy'
		'module.main'
		'module.profiles'
		]).run(
			( $rootScope ) ->
				console.log "app run"

				#######################################################
				#
				# Check session saved in session storage
				#
				#######################################################
				console.log "sessionStorage.currentSession"
				console.log sessionStorage.currentSession
				if sessionStorage.currentSession?
					window.bootstrappedUserObject = angular.fromJson(sessionStorage.currentSession)
					# let everything know that we need to restore session now.
					window.onload = ( ) ->
						#console.log "on load"
						$rootScope.$broadcast('restoreSession', angular.fromJson(sessionStorage.currentSession) )



		).config([
			'$routeProvider'
			'$locationProvider'
			'RestangularProvider'
			( $rp, $lp, restAngularProvider ) ->

				$rp
					.when '/',
						templateUrl: '/partials/app/templates/dummy.html'
						controller: 'DummyCtrl'

					.when '/profile',
						templateUrl: '/partials/app/templates/profile.html'
						controller: 'ProfilesCtrl'

					.otherwise
						redirectTo: '/'

				$lp.html5Mode({
					enabled: true,
					requireBase: true
				})

				$lp.hashPrefix( '!' )

				# restangular base api url
				restAngularProvider.setBaseUrl('http://localhost:3030/api/v1')

				return
])

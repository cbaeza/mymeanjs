angular
	.module('mymeanjs', [

		# external modules
		'ngRoute'
		'ui.bootstrap'
		'restangular'
		'angular-md5'

		# local modules
		# 'app.header' # Deprecated, bad idea !, delegate all in MainController
		'module.dummy'
		'module.main'

		]).config([
			'$routeProvider'
			'$locationProvider'
			'RestangularProvider'
			( $rp, $lp, restAngularProvider ) ->

				$rp
					.when '/',
						templateUrl: '/partials/app/templates/dummy.html'
						controller: 'DummyCtrl'

					.otherwise
						redirectTo: '/'

				$lp.html5Mode({
					enabled: true,
					requireBase: true
				});
				$lp.hashPrefix( '!' )

				# restangular base api url
				restAngularProvider.setBaseUrl('http://localhost:3030/api/v1')

				return
])

angular.module('mymeanjs', [

	# external modules
	'ngRoute'
	'ui.bootstrap'

	# local modules
	# 'app.header' # Deprecated, bad idea !, delegate all in MainController
	'module.dummy'
	'module.main'

	]).config([
		'$routeProvider'
		'$locationProvider'
		( $rp, $lp ) ->

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

			return
])

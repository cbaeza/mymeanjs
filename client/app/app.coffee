angular.module('mymeanjs', [

	# external modules
	'ngRoute'
	'ui.bootstrap'

	# local modules
	'app.header'
	'module.dummy'
	'module.main'

	]).config([
		'$routeProvider'
		'$locationProvider'
		( $rp, $lp ) ->

			$rp
				.when '/',
					templateUrl: '/partials/dummy.html'
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

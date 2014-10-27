angular.module('mymeanjs', [
	'module.dummy'
	'module.main'
	'ngRoute'
	]).config([
		'$routeProvider'
		'$locationProvider'
		( $rp, $lp ) ->

			$rp
				.when '/',
					templateUrl: '/partials/dummy/dummy.html'
					controller: 'DummyCtrl'

				.otherwise
					redirectTo: '/'

			$lp.html5Mode( true )
			$lp.hashPrefix( '!' )

			return
])

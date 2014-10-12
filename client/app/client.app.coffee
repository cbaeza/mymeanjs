angular.module('mymeanjs', [
	'module.dummy'
	'ngRoute'
	]).config([
		'$routeProvider'
		'$locationProvider'
		( $rp, $lp ) ->

			$rp
				.when '/',
					templateUrl: '/partials/dummy/dummy.html'
					controller: 'DummyCtrl'
					# module: 'module.dummy'

				.otherwise
					redirectTo: '/'

			$lp.html5Mode( true )
			$lp.hashPrefix( '!' )

			return
])

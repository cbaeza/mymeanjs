angular.module('mymeanjs', ['module.dummy', 'ngRoute']).config([
  '$routeProvider', '$locationProvider', function($rp, $lp) {
    $rp.when('/', {
      templateUrl: '/partials/dummy/dummy.html',
      controller: 'DummyCtrl'
    }).otherwise({
      redirectTo: '/'
    });
    $lp.html5Mode(true);
    $lp.hashPrefix('!');
  }
]);
;angular.module('module.dummy.controller').controller('DummyCtrl', [
  '$scope', function($scope) {
    return console.log('DummyCtrl init');
  }
]);
;angular.module('module.dummy', ['module.dummy.controller', 'module.dummy.service']);
;angular.module('module.dummy.service', []);

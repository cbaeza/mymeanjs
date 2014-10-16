angular.module('module.dummy', ['module.dummy.controller', 'module.dummy.service']);
;angular.module('module.dummy.controller', ['module.dummy.service']).controller('DummyCtrl', [
  '$scope', 'DummySrvc', function($scope, dummySrvc) {
    console.log('DummyCtrl init');
    dummySrvc.sayHello();
    $scope.status = "ready to go!";
    return $scope.sayHello = function() {
      return "hello from controller !";
    };
  }
]);
;angular.module('module.dummy.service', []).service('DummySrvc', [
  '$q', '$http', function($q, $http) {
    this.sayHello = function() {
      return console.log("service say hello!");
    };
  }
]);
;angular.module('mymeanjs', ['module.dummy', 'ngRoute']).config([
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

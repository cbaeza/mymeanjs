angular.module('module.dummy', ['module.dummy.controller', 'module.dummy.service']);
;angular.module('module.dummy.controller', ['module.dummy.service']).controller('DummyCtrl', [
  '$scope', 'DummySrvc', function($scope, dummySrvc) {
    console.log('DummyCtrl init');
    dummySrvc.sayHello();
    $scope.status = "ready to go from DummyCtrl controller!";
    return $scope.sayHello = function() {
      return "hello from DummyCtrl controller!";
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
;angular.module('module.main', ['module.main.controller', 'module.main.service']);
;angular('module.main.controller', ['module.main.service']).controller('MainCtrl', [
  '$scope', 'MainSrvc', function($scope, mainService) {
    console.log('MainCtrl init');
    $scope.status = "ready to go from Main controller!";
    return $scope.sayHello = function() {
      return "hello from Main controller!";
    };
  }
]);
;angular.module('module.main.service', []).service('MainSrvc', [
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

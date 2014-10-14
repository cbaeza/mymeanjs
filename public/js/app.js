angular.module('mymeanjs', ['module.dummy', 'ngRoute']).config([
  '$routeProvider', '$locationProvider', function($rp, $lp) {
    $rp.when('/', {
      templateUrl: '/partials/dummy/dummy.html'
    }).otherwise({
      redirectTo: '/'
    });
    $lp.html5Mode(true);
    $lp.hashPrefix('!');
  }
]);
;angular.module('module.dummy.controller', []);
;angular.module('module.dummy', ['module.dummy.controller', 'module.dummy.service']);
;angular.module('module.dummy.service', []);
;angular.module('module.dummy').controller('DummyCtrl', [
  '$scope', 'DummySrvc', function($scope, dummySrvc) {
    console.log('DummyCtrl init');
    return $scope.sayHello = function() {
      dummySrvc();
      return "hello from controller !";
    };
  }
]);
;angular.module('module.dummy', []).run(console.log("runing"), DummyCtrl.sayHello());
;angular.module('module.dummy').service('DummySrvc', [
  this.sayHello = function() {
    return console.log("service say hello!");
  }
]);

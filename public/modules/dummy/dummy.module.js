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

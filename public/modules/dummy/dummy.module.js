angular.module('module.dummy', ['module.dummy.controller', 'module.dummy.service']);
;angular.module('module.dummy.service').service('DummySrvc', [
  '$q', '$http', function($q, $http) {
    return this.sayHello = function() {
      return console.log("service say hello!");
    };
  }
]);
;angular.module('module.dummy.controller').controller('DummyCtrl', [
  '$scope', 'DummySrvc', function($scope, dummySrvc) {
    console.log('DummyCtrl init');
    return $scope.sayHello = function() {
      return "hello from controller !";
    };
  }
]);

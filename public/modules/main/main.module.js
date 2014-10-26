angular.module('module.main', ['module.main.controller', 'module.main.service']);
;angular('module.main.controller', ['module.main.service']).controller('MainCtrl', [
  '$scope', 'MainService', function($scope, mainService) {
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

angular.module('module.profiles.controller', ['module.profiles.service']).controller('ProfilesCtrl', [
	'$scope'
	'ProfilesSrvc'
	( $scope, profilesSrvc ) ->
		console.log 'ProfilesCtrl init'

		profilesSrvc.sayHello()

		$scope.status = "ready to go from ProfilesCtrl controller!"
		$scope.sayHello = ( ) ->
			return "hello from ProfilesCtrl controller!"
])

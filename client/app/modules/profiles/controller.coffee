angular.module('module.profiles.controller', ['module.profiles.service']).controller('ProfilesCtrl', [
	'$scope'
	'$location'
	'ProfilesSrvc'
	( $scope, location, profilesSrvc ) ->

		#console.log 'ProfilesCtrl init'

		# check authenticate user
		#console.log(window.bootstrappedUserObject)
		if not window.bootstrappedUserObject?
			location.path('/')

		# profilesSrvc.sayHello()

		$scope.status = "ready to go from ProfilesCtrl controller!"
		$scope.sayHello = ( ) ->
			return "hello from ProfilesCtrl controller!"
])

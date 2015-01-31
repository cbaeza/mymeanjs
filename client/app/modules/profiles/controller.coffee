angular
	.module('module.profiles.controller', ['module.profiles.service'])
	.controller('ProfilesCtrl', [
		'$scope'
		'$location'
		'ProfilesSrvc'
		'userProfile'
		( $scope, location, profilesSrvc, userProfile ) ->

			console.log 'ProfilesCtrl init'
			console.log(userProfile)

			# check authenticate user
			#console.log(window.bootstrappedUserObject)
			if not window.bootstrappedUserObject?
				location.path('/')

			$scope.status = "ready to go from ProfilesCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from ProfilesCtrl controller!"
	])

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

			$scope.profile =
				_id: 		userProfile._id
				userid: 	userProfile.userid
				email: 		userProfile.email
				lastname: 	userProfile.lastname
				name: 		userProfile.name

			$scope.status = "ready to go from ProfilesCtrl controller!"

			$scope.sayHello = ( ) ->
				return "hello from ProfilesCtrl controller!"
	])

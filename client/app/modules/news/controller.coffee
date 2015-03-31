angular
	.module('module.news.controller', ['module.news.service'])
	.controller('NewsCtrl', [
		'$scope'
		'NewsSrvc'
		( $scope, newsSrvc ) ->

			# check authenticate user
			#console.log(window.bootstrappedUserObject)
			if not window.bootstrappedUserObject?
				location.path('/')

			$scope.status = "ready to go from NewsCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from NewsCtrl controller!"
	])

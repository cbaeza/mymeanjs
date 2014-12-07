angular
	.module('module.myoffers.controller', ['module.myoffers.service'])
	.controller('MyOffersCtrl', [
		'$scope'
		'$location'
		'MyOffersSrvc'
		( $scope, location, myOffersSrvc ) ->

			#console.log 'MyOffersCtrl init'

			# check authenticate user
			#console.log(window.bootstrappedUserObject)
			if not window.bootstrappedUserObject?
				location.path('/')

			$scope.status = "ready to go from MyOffersCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from MyOffersCtrl controller!"
	])

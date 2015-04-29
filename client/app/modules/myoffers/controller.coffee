angular
	.module('module.myoffers.controller', ['module.myoffers.service'])
	.controller('MyOffersCtrl', [
		'$scope'
		'$location'
		'MyOffersSrvc'
		( $scope, location, myOffersSrvc ) ->

			$scope.status = "ready to go from MyOffersCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from MyOffersCtrl controller!"
	])

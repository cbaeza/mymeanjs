angular
	.module('module.favourites.controller', ['module.favourites.service'])
	.controller('FavouritesCtrl', [
		'$scope'
		'FavouritesSrvc'
		( $scope, favouritesSrvc ) ->

			#console.log 'FavouritesCtrl init'

			favouritesSrvc.sayHello()

			$scope.status = "ready to go from FavouritesCtrl controller!"
			$scope.sayHello = ( ) ->
				return "hello from FavouritesCtrl controller!"
	])

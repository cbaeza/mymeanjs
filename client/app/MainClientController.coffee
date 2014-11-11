# MainController for client
# Responsible of:
#		handler authentication for users
#
angular.module('mymeanjs').controller('MainClientController', [
	'$scope'
	( $scope ) ->
		console.log('MainClientController init')

		$scope.logggedUser = {
			username: null
			password: null
			loggedOn: null
		}

		$scope.authenticate = ( event ) ->
			console.log("authenticate MainClientController: "+ $scope.logggedUser )

])
# MainController for client
# Responsible of:
#		handler authentication for users
#
angular.module('mymeanjs').controller('MainClientController', [
	'$scope'
	( $scope ) ->
		console.log('MainClientController init')

		$scope.user = {
			username: null
			password: null
			loggedOn: Date.now()
		}

		$scope.authenticate = ( event ) ->
			console.log("authenticate MainClientController: "+ JSON.stringify($scope.user) )

])

# SignInModalCtrl for client
# Responsible of:
#		handler login action for register users
#
angular
	.module('mymeanjs')
	.controller('SignInModalCtrl', [
			'$scope'
			'$rootScope'
			'$location'
			'$modal'
			'AuthenticatorSrvc'
			'SystemMessages'
			'SessionMgmt'
			( $scope, $rootScope, $location, $modal, AuthenticatorSrvc, SystemMessages, SessionMgmt ) ->

				$scope.credentials = {
					email: null
					password: null
					rememberMe: false
				}

				$scope.authenticate = ( event ) ->
					AuthenticatorSrvc.login($scope.credentials).then(

						( data ) ->
							SessionMgmt.initSession( data, $scope.credentials.rememberMe )
							$rootScope.$broadcast('signInEvent', data)
							$scope.$dismiss('cancel')

						( error ) ->
							SystemMessages.danger(error.data.error)
				)

				$scope.close = ( event ) ->
					console.log('do Register')
					$scope.$dismiss('cancel')
	])
angular
	.module('app.header', [])
	.directive( 'appHeader', [
		() ->
			restrict: 'AE'
			replace: true
			template: '"[[app/js/modules/header/header]]"'
			scope: {}
			require: 'MainClientController'
#			controller: ['$scope'
#				( $scope ) ->
#					console.log("directive controller init")
#
#					$scope.authenticate = ( event ) ->
#						console.log("authenticate: #{event}")
#			]
	])
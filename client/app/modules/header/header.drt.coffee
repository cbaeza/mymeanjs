# Deprecated, bad idea !, delegate all in MainController
angular
	.module('app.header', [])
	.directive( 'appHeader', [
		() ->
			restrict: 'AE'
			replace: true
			template: '"[[app/modules/header/header]]"'
			scope: {}
			require: ['^MainClientController']
			#link: ( scope, element, attrs, controllers ) ->
			link: ( scope, element, attrs, controllers ) ->
				mainCtrl = controllers[0]
				mainCtrl.authenticate();
#			controller: ['$scope'
#				( $scope ) ->
#					console.log("directive controller init")
#
#					$scope.authenticate = ( event ) ->
#						console.log("authenticate: #{event}")
#			]
	])
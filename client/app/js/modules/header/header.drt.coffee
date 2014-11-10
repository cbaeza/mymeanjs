angular
	.module('app.header', [])
	.directive( 'appHeader', [
		() ->
			restrict: 'AE'
			replace: true
			template: '"[[app/js/modules/header/header]]"'
			scope: {}
			controller: ['$scope'
				( $scope ) ->
					console.log("directive controller init")
			]
	])
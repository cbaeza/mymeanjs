angular
	.module('module.home.controller', ['module.home.service'])
	.controller('HomeCtrl', [
		'$scope'
		'HomeSrvc'
		( $scope, homeSrvc ) ->

			$scope.buttonMessage = "Go"
			$scope.status = "ready to go from HomeCtrl controller!"

			$scope.interval = 5000	
			$scope.slides = []

			$scope.addSlide = ()->
				newWidth = 600 + $scope.slides.length + 1
				$scope.slides.push({
						image: 'http://placekitten.com/' + newWidth + '/300',
						text : ['More','Extra','Lots of','Surplus'][$scope.slides.length % 4] + ' ' + ['Cats', 'Kittys', 'Felines', 'Cutes'][$scope.slides.length % 4]
					})

			for i in [1..4]
				$scope.addSlide()

			$scope.sayHello = ( ) ->
				return "hello from HomeCtrl controller!"
	])

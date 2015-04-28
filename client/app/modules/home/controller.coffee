angular
	.module('module.home.controller', ['module.home.service'])
	.controller('HomeCtrl', [
		'$scope'
		'HomeSrvc'
		( $scope, homeSrvc ) ->

			$scope.buttonMessage = "Go"
			$scope.status = "subtitle!"

			$scope.interval = 5000
			$scope.slides = []

			$scope.addSlide = (i) ->
				#console.log "add slide " + i
				newWidth = 1024 + i + 1
				$scope.slides.push({
						image: 'http://placekitten.com/' + newWidth + '/300',
						text : ['More','Extra','Lots of','Surplus'][$scope.slides.length % 4] + ' ' + ['Cats', 'Kittys', 'Felines', 'Cutes'][$scope.slides.length % 4]
					})

			for i in [1..6]
				$scope.addSlide(i)

			$scope.sayHello = ( ) ->
				return "hello from HomeCtrl controller!"
	])

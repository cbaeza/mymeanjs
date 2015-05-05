angular
	.module('module.home.controller', ['module.home.service'])
	.controller('HomeCtrl', [
		'$scope'
		'HomeSrvc'
		( $scope, homeSrvc ) ->

			$scope.buttonMessage = "Go"
			$scope.status = "subtitle!"

			$scope.interval = 5000
			$scope.slides = [
				{ image:'http://wp.treintalobitos.de/wp-content/uploads/2014/10/copy-gruppe-4-header1400x400.jpg', text:'un lobito'}
				{ image:'http://wp.treintalobitos.de/wp-content/uploads/2014/10/gruppe-1-header1400x400.jpg', text:'otro lobito'}
				{ image:'http://wp.treintalobitos.de/wp-content/uploads/2014/10/hund-cuba-1400x400.jpg', text:'un perro'}
			]

#			$scope.addSlide = (i) ->
#				#console.log "add slide " + i
#				newWidth = 1024 + i + 1
#				$scope.slides.push({
#						image: 'http://placekitten.com/' + newWidth + '/300',
#						text : ['More','Extra','Lots of','Surplus'][$scope.slides.length % 4] + ' ' + ['Cats', 'Kittys', 'Felines', 'Cutes'][$scope.slides.length % 4]
#					})
#
#			for i in [1..6]
#				$scope.addSlide(i)

			$scope.sayHello = ( ) ->
				return "hello from HomeCtrl controller!"
	])

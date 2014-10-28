# Api version 1

UserCtrl = require('../../controllers/users/user.ctrl')
version = 'v1'
api = "/api/#{version}"

module.exports = ( app ) ->

	app
		.get( api , ( req, res ) -> res.json({'version': version }))
		.get( api + '/version', ( req, res ) -> res.json({'version': version }))

		.get( api + "/users", UserCtrl.select )

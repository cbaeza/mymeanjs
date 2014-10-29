# Api version 1

UserCtrl = require('./users/user.ctrl')
version = 'v1'
api = "/api/#{version}"

versioninfo = {
	'version': version
	'date': Date.now()
}

module.exports = ( app ) ->

	app
		.get( api 				, ( req, res ) -> res.json( versioninfo ))
		.get( api + '/version'	, ( req, res ) -> res.json( versioninfo ))

		.get( api + "/users"	, UserCtrl.select )

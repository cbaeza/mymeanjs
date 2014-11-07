# Api version 1

UserCtrl = require('./users/user.ctrl')
version = 'v1'
api = "/api/#{version}"

versioninfo = {
	'version': version
	'date': '29.10.2014'
}

module.exports = ( app, passport ) ->

	app
		.get( api 				, ( req, res ) -> res.json( versioninfo ))
		.get( api + '/version'	, ( req, res ) -> res.json( versioninfo ))

		.get( api + "/users"	, passport.authenticate('local', { failureRedirect: '/login'}), UserCtrl.select)

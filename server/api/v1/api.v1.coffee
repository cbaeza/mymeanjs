# Api version 1

jwt			= require('jsonwebtoken')

UserCtrl    = require('./users/user.ctrl')
EmailCtrl   = require('./email/email.ctrl')
ProfileCtrl = require('./profile/profile.ctrl')
User 		= require('./users/user.mdl')
UserModel 	= new User()

i18nCtrl 	= require('../../public_services/i18n/i18n.ctrl')

version = 'v1'
api = "/api/#{version}"

versioninfo = {
	'version': version
	'build date': Date.now()
}

module.exports = ( app, config ) ->

	app
		# AUTH using JWT (JSON web token). If user match, it return a session token
		.post( '/auth/login', (req, res) ->
			console.log( req.body )
			UserModel.authenticate req.body, ( error, user ) ->
				return res.status(400).json({ 'error' : error }) if error
				
				if user?
					console.log("-----------NEW JWT SESSION ------------------")
					token = jwt.sign(user, config.secret, { expiresInMinutes: 3600000 * 24 * 7 }); # one week
					user.token = token
					console.log( user )
					console.log("-----------------------------------------")
					res.status(200).send( { user: user } )
		)
		.post( '/auth/logout', (req, res) ->
			# TODO: how to expire a token ?
			console.log("OK, logout")
			res.status(200).send()
		)

		#################################################################
		#
		# '/public/*' public zone utilized to get data like i18n
		#
		#################################################################
		.get( '/public_services/i18n',	i18nCtrl.getKeys )
	
		#################################################################
		#
		# '/api/*' (V1) will be protected via token generated via JWT
		#
		#################################################################

		#.post( '/auth/login' 			, UserCtrl.login ) # deprecated by JWT
		#.post( '/auth/logout' 			, UserCtrl.logout ) # deprecated by JWT
		.post( '/auth/accounts'			, UserCtrl.create )
		.post( '/auth/account/verify'	, UserCtrl.verify )

		# API V1
		.get( api 				, ( req, res ) -> res.json( versioninfo ))
		.get( api + '/version'	, ( req, res ) -> res.json( versioninfo ))

		# USER
		.get( api + '/users'	, UserCtrl.select )
		.get( api + '/user'		, UserCtrl.search )

		# PROFILE
		.get(  api + '/profile/:id'	, ProfileCtrl.getProfile )
		.post( api + '/profile'		, ProfileCtrl.createProfile )

		# EMAIL
		.post( api + '/email'	,  EmailCtrl.sendEmail )

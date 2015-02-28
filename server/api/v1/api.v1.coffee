# Api version 1

UserCtrl    = require('./users/user.ctrl')
EmailCtrl   = require('./email/email.ctrl')
ProfileCtrl = require('./profile/profile.ctrl')

version = 'v1'
api = "/api/#{version}"

versioninfo = {
	'version': version
	'build date': Date.now()
}

module.exports = ( app ) ->

	app
		.all( '/api/*',
			(req, res, next) ->
				console.log( "checking user on session...")
				console.log(req.session)
				if not req.session.user
					console.log "no session"
					res.status(401).json( { error : 'require auth' } ).send()
				else
					console.log("session active")
					console.log(req.session)
					next()
		)
		# AUTH
		.post( '/auth/login' 			, UserCtrl.login )
		.post( '/auth/logout' 			, UserCtrl.logout )
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

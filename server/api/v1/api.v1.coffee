# Api version 1

UserCtrl    = require('./users/user.ctrl')
EmailCtrl   = require('./email/email.ctrl')

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
				console.log( "checking auth: " + req.session.user)
				if not req.session.user
					console.log "no session"
					res.status(400).json( { error : 'require auth' } ).send()
				else
					console.log("session active")
					next()
		)
		.post( '/auth/login'         , UserCtrl.login )
		.post( '/auth/logout'        , UserCtrl.logout )

		# API
		.get( api 				, ( req, res ) -> res.json( versioninfo ))
		.get( api + '/version'	, ( req, res ) -> res.json( versioninfo ))
		.get( api + '/users'	            , UserCtrl.select )

		# email
		.post( api + '/email',  EmailCtrl.sendEmail )

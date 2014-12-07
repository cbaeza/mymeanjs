# Api version 1

UserCtrl    = require('./users/user.ctrl')
EmailCtrl   = require('./email/email.ctrl')

version = 'v1'
api = "/api/#{version}"

versioninfo = {
	'version': version
	'build date': Date.now()
}

module.exports = ( app, passport ) ->

	app.all( '/api/*',
		(req, res, next) ->
			console.log( "require Auth: " + req.session.user)
			if not req.session.user
				console.log "user null"
				res.status(400).json( { error : 'require auth' } ).send()
			else
				# validate user/token?
				next()
	)
		.post( '/users/login'         , UserCtrl.login )
		.get( api 				, ( req, res ) -> res.json( versioninfo ))
		.get( api + '/version'	, ( req, res ) -> res.json( versioninfo ))
		.get( api + '/users'	            , UserCtrl.select )
		.post( api + '/users/logout'        , UserCtrl.logout )
		#.get( api + "/users"	, passport.authenticate('local', { failureRedirect: '/login'}), UserCtrl.select)

		# email
		.post( api + '/email',  EmailCtrl.sendEmail )

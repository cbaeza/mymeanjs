
passport        = require('passport')
LocalStrategy   = require('passport-local').Strategy
Account        = require('./Authenticator')

module.exports = ( config, app ) ->

	app.use passport.initialize()
	app.use passport.session()

	passport.use new LocalStrategy( (username, password, done) ->
		Account.findOne({ username : username }, (err,user) ->
			return done(err) if err
			if !user
				return done(null, false, { message: 'Incorrect username.' })

			hash( password, user.salt, (err, hash) ->
				return done(err) if err
				if (hash == user.hash)
					return done(null, user)

				done(null, false, { message: 'Incorrect password.'} )
			)))

	passport.serializeUser ( user, done ) ->
		done( null, user._id )

	passport.deserializeUser ( id, done ) ->
		Account.findOne {_id: id}, (err, user) ->
			done(err, user)

	console.log('passport init...')
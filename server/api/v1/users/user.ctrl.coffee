# User controller

uuid = require('node-uuid')
md5 = require('MD5')
email = require('../email/email.ctrl')

User = require('./user.mdl')
UserModel = new User()

Profile = require('../profile/profile.mdl')

module.exports =

	login: ( req, res ) ->
		#console.log( req.body )
		UserModel.authenticate req.body, ( error, user ) ->
			return res.status(400).json({ 'error' : error }) if error
			#console.log(user)
			# set user in session
			req.session.user = {
				_id: user._id
				name: user.name
				lastname: user.lastname
				email: user.email
				creationDate: user.creationDate
			}
			console.log("-----------NEW SESSION ------------------")
			console.log(req.session)
			console.log("-----------------------------------------")
			res.status(200).send( user )

	logout: ( req, res ) ->
		req.session.user = null;
		console.log("OK, logout")
		res.status(200).json( 'message': 'OK')

	select: ( req, res ) ->
		#console.log("select !")
		UserModel.getAllUsers ( error, data ) ->
			return res.status(400).json({ 'error' : error }) if error
			return res.status(200).send( data )

	create: ( req, res ) ->
		user = new User(req.body)
		user.email = req.body.email.toLowerCase()
		user.token = uuid.v1()
		user.verified = false
		user.password = md5(user.password)
		user.roles = ['authenticated_user']
		console.log user

		user.save( ( error ) ->
			
			if(error)
				return res.status(400).json({'error:':'User email already registered!'}) if ( error.toString().indexOf('E11000') > -1)
				return res.status(400).json({ 'error' : error }) if error
			
			#return email.sendAccountVerificationEmail(req, res, user)
			return res.status(200).send( user.getPublicFields() )
		)

	search: ( req, res ) ->
		q = req.query.q

		query = { $or : [ { email : q }, { name : q }, { lastname : q } ] }

		User.findOne( query, (error, user ) ->
			return res.status(400).json({ 'error' : error }) if error
			return res.status(200).send( 'message' : 'not found' ) if not user
			return res.status(200).send( user.getPublicFields() )
		)

	verify: ( req, res ) ->
		token = req.body.token

		update =
			verified : true
			$unset:
				token: ""

		User.findOneAndUpdate( { 'token' : token }, update, ( error, user ) ->
			return res.status(400).json({ 'error' : error }) if error
			return res.status(200).send( 'message' : 'not found' ) if not user

			# create Profile
			profile = new Profile()
			profile.userid = user._id
			profile.name = user.name
			profile.lastname = user.lastname
			profile.email = user.email

			profile.save( ( error ) ->
				return res.status(400).json({ 'error' : 'Error creating profile: ' + error }) if error	
			)

			return res.status(200).send( user.getPublicFields() )
		)



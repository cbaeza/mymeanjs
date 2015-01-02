# User controller

uuid = require('node-uuid')
md5 = require('MD5')
email = require('../email/email.ctrl')

User = require('./user.mdl')
UserModel = new User()

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
		res.status(200).json( 'message': 'OK')

	select: ( req, res ) ->
		#console.log("select !")
		UserModel.getAllUsers ( error, data ) ->
			return res.status(400).json({ 'error' : error }) if error
			return res.status(200).send( data )

	create: ( req, res ) ->
		user = new User(req.body)
		user.token = uuid.v1()
		user.verified = false
		user.password = md5(user.password)
		console.log user

		user.save ( error ) ->
			return res.status(400).json({ 'error' : error }) if error
			email.sendAccountVerificationEmail(user)
			return res.status(200).send( user.getPublicFields() )

	search: ( req, res ) ->
		q = req.query.id
		User.findOne({ 'email' : q}, (error, user ) ->
			return res.status(400).json({ 'error' : error }) if error
			return res.status(200).send( 'message' : 'not found' ) if not user
			return res.status(200).send( user.getPublicFields() )
		)

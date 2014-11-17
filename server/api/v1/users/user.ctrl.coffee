# User controller

User = require('./user.mdl')
UserModel = new User()

module.exports =

	login: ( req, res ) ->
		#console.log( req.body )
		UserModel.authenticate req.body, ( error, user ) ->
			return res.status(400).json({ 'error message' : error }) if error
			#console.log(user)
			# set user in session
			req.session.user = {
				_id: user._id
				name: user.name
				lastname: user.lastname
				email: user.email
				creationDate: user.creationDate
			}
			console.log(req.session)
			res.status(200).send( user )


	select: ( req, res ) ->
		console.log("select !")
		UserModel.getAllUsers ( error, data ) ->
			return res.status(400).json({ 'message' : error }) if error
			return res.status(200).send( data )
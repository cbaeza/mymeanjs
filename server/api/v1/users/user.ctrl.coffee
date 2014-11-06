# User controller

UserModel = require('./user.mdl')
_userModel = new UserModel()

module.exports =

	select: ( req, res ) ->
		console.log("select !")
		_userModel.getAllUsers ( error, data ) ->
			return res.status(400).json({ 'message' : error }) if error
			return res.status(200).send( data )
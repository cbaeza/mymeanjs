# User controller

UserModel = require('./user.mdl')
userModel = new UserModel()

module.exports =

	select: ( req, res ) ->
		console.log("select !")
		res.status(200).json({ message: 'all ist ok'})
# User controller

UserModel = require('../../models/users/user.mdl')
userModel = new UserModel()

module.exports =

	select: ( req, res ) ->
		console.log("select !")
		res.status(200).json({ message: 'all ist ok'})
# User controller

UserModel = require('../../models/users/user.mdl')
userModel = new UserModel()

module.exports = () ->

	return handlers =
		select: ( req, res ) ->
			res.status(200).json({ message: 'all ist ok'})
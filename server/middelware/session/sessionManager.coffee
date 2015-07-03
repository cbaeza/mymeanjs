###############################################
# Manager session based on generated token
# Manager session CRUD
###############################################

uuid = require('node-uuid')

Session = require('./session.mdl')
SessionModel = new Session()

module.exports = ( req, res, next ) ->
		console.log('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
		console.log(req.user)
		console.log(req.headers.authorization)

		next()


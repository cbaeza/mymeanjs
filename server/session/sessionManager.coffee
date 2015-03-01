###############################################
# Manager session based on generated token
# Manager session CRUD
###############################################

uuid = require('node-uuid')

User = require('../api/v1/user/user.mdl')
UserModel = new User()

Session = require('./session.mdl')
SessionModel = new Session()

module.exports = {
	
	createSession : ( userId ) ->
		
		UserModel.findOne( { _id: userId }, (error, user ) ->
			return null if error
			
			if user?
				console.log result
				session = new Session()
				session.token = uuid.v1()
				session.user = user
				return session
		)
		
		
	deleteSession: ( req, token ) ->
		
	checkSession: ( token )	->
		
}
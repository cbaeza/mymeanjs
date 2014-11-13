# Model representing user in system

mongoose    = require('mongoose')
_modelName  = 'users'

_schema = new mongoose.Schema(

	name:
		type: String
		required: false

	lastname:
		type: String
		required: false

	email:
		type: String
		required: true

	password:
		type: String
		required: true

	creationDate:
		type: Date
		default: Date.now()

)

_schema.methods =

	authenticate: ( user, cb ) ->
		this.model( _modelName ).findOne { email : user.email }, ( error, user ) ->
			return cb( error ) if error?
			return cb( new Error('user not found') ) if !user?
			return cb( user )

	getAllUsers: ( cb ) ->
		this.model( _modelName ).find ( error, data ) ->
			return cb( error ) if error
			return cb( null, data )


module.exports = mongoose.model( _modelName, _schema)

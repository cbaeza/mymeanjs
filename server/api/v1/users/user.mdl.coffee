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

_fields = '_id name lastname email creationDate'

_schema.methods =

	authenticate: ( user, cb ) ->
		this.model( _modelName ).findOne { email : user.email }, _fields, ( error, results ) ->
			return cb( error ) if error
			return cb( new Error('user not found') ) if !results?
			return cb( null, results )

	getAllUsers: ( cb ) ->
		this.model( _modelName ).find( ).select( _fields ).exec ( error, results ) ->
			return cb( error ) if error
			return cb( null, results )


module.exports = mongoose.model( _modelName, _schema)

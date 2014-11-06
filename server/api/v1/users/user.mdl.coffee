# Model representing user in system

mongoose = require('mongoose')

_schema = new mongoose.Schema(

	name:
		type: String
		required: true

	lastname:
		type: String
		required: true

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

	getAllUsers: ( cb ) ->
		this.model( _schema ).find ( error, data ) ->
			return cb( error ) if error
			return cb( null, data )


module.exports = mongoose.model('users', _schema)

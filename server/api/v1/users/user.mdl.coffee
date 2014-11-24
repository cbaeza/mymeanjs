# Model representing user in system

mongoose    = require('mongoose')
_modelName  = 'users'
_           = require('lodash')

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
		required: true
)

_fields = '_id name lastname email creationDate'

_schema.methods =

	authenticate: ( user, cb ) ->
		this.model( _modelName ).findOne { email : user.email }, ( error, result ) ->
			return cb( error ) if error
			return cb( 'user not found' ) if !result?
			#console.log(result.password)
			#console.log(user.password)
			if result.password is user.password
				return cb( null, _.pick( result, _fields.split(' ')) )
			else
				return cb( 'password invalid' )

	getAllUsers: ( cb ) ->
		this.model( _modelName ).find( ).select( _fields ).exec ( error, results ) ->
			return cb( error ) if error
			return cb( null, results )


module.exports = mongoose.model( _modelName, _schema)

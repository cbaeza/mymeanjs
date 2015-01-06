mongoose    = require('mongoose')
_modelName  = 'profile'
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
)

#_schema.methods =
#
#	bla: ( cb )


module.exports = mongoose.model( _modelName, _schema)
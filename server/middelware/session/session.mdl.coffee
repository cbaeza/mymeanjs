mongoose    = require('mongoose')
_modelName  = 'session'
_           = require('lodash')

_schema = new mongoose.Schema(

	token:
		type: String
		require: true
		indexed: true

	lastUpdate:
		type: Date
		default: Date.now()
		
	user:
		type : Object
		require: true
)

#_schema.methods =
#
#	bla: ( cb )


module.exports = mongoose.model( _modelName, _schema)
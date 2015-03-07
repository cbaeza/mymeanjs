# i18n model

mongoose    = require('mongoose')
_modelName  = 'i18n'
_           = require('lodash')

_schema = new mongoose.Schema(

	lang:
		type:String
		require: true
		indexed:true

	keys:[]
)

module.exports = mongoose.model( _modelName, _schema)
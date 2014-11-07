# Auth for users
mongoose = require('mongoose')
passportLocalMongoose = require('passport-local-mongoose');

_schema = new mongoose.Schema({
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
})

#_schema.methods =
#
#	authenticate: ( username, password ) ->
#		return true

_schema.plugin(passportLocalMongoose)

module.exports = mongoose.model('Account', _schema)
# Model representing user in system

mongoose = require('mongoose')

userSchema = new mongoose.Schema(

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

module.exports = mongoose.model('User', userSchema)

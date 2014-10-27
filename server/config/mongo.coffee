
module.exports = ( config, mongoose ) ->

	mongoose.connect( config.db )

	mongoose.connection.once 'open', () -> console.log('mongodb mymean open...')
	mongoose.connection.on 'error', () -> console.error.bind( console, 'connection error...')


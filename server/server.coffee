express 		= require('express')
methodOverride 	= require('method-override')
bodyParser		= require('body-parser')

env = process.env.NODE_ENV = process.env.NODE_ENV || 'development'
config = require('./config/config')[env]

app 	= express()

# configure app
app.set 'port', 3030
app.set 'view engine', 'jade'
app.set 'views', "./server/views"
app.use methodOverride()
app.use bodyParser.json()
app.use express.static( "./public" )
app.use express.static( "./bower_components" )

# routes
require('./routes')(app)

# start server
app.listen 3030, ( ) ->
	console.log "Server started, listen on port #{app.get('port')}"
	console.log config

express 		= require('express')
methodOverride 	= require('method-override')
bodyParser		= require('body-parser')
mongoose		= require('mongoose')

env = process.env.NODE_ENV = process.env.NODE_ENV || 'development'
# init config passing current environment
config = require('./config/config')[env]

app 	= express()

# configure app
app.set 'port', 3030
app.set 'view engine', 'jade'
app.set 'views', "./server/views"
# use methodOverride to simplify access to http methods
app.use methodOverride()
# parse application/json
app.use bodyParser.json()
# all static resources
app.use express.static( "./public" )
app.use express.static( "./bower_components" )

# configure mongodb via mongoose
require('./config/mongo')( config, mongoose )
# routes
require('./routes/routes')(app)

# start server
app.listen 3030, ( ) ->
	console.log "Server started, listen on port #{app.get('port')}"
	console.log config

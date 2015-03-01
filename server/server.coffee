express 		= require('express')
methodOverride 	= require('method-override')
bodyParser		= require('body-parser')
#cookieparser    = require("cookie-parser")
session			= require('express-session')
expressJwt 		= require('express-jwt')



env = process.env.NODE_ENV = process.env.NODE_ENV || 'development'
# init config passing current environment
config = require('./config/config')[env]

app = express()

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

# jwt implementation
secret = 'My-Mean-Secret'
app.use '/api/*', expressJwt( {secret: secret} )

# cookie based session
#app.use cookieparser()
#app.use session(
#	{
#		secret: 'secret'
#		cookie:
#			path: '/'
#			secure: false
#			maxAge: 3600000 * 24 * 7 # one week
#			httpOnly: false,
#		saveUninitialized: true
#		resave: true
#	} )

# configure mongodb via mongoose
require('./config/mongo')( config )

# api, define api always first as default routes
require('./api/v1/api.v1')( app, secret )

# default routes
require('./routes/routes')( app )

# start server
app.listen 3030, ( ) ->
	console.log "Server started, listen on port #{app.get('port')}"
	console.log config
	console.log process.env.PWD

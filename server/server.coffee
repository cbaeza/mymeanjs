express 		= require('express')
#methodOverride 	= require('method-override')
bodyParser		= require('body-parser')
#cookieparser    = require("cookie-parser")
session			= require('express-session')
expressJwt 		= require('express-jwt')
sessionMgmt 	= require('./middelware/session/sessionManager')


env = process.env.NODE_ENV = process.env.NODE_ENV || 'development'
# init config passing current environment
config = require('./config/config')[env]
#console.log config

app = express()

# configure app
app.set 'port', 3030
app.set 'view engine', 'jade'
app.set 'views', "./server/views"

# use methodOverride to simplify access to http methods
#app.use methodOverride()

# parse application/json
app.use bodyParser.json()

# all static resources
app.use express.static( "./public" )
app.use express.static( "./bower_components" )

# jwt implementation
app.use config.api_route, expressJwt( {secret: config.secret} )

# session mgmt
app.use config.api_route, sessionMgmt

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
require('./api/v1/api.v1')( app, config )

# default routes
require('./routes/routes')( app )

# error handling
app.use (err, req, res, next) ->
	if (err.name is 'UnauthorizedError')
		console.log(err)
		res.status(401).send( 'error' : 'invalid token...')
	else
		console.log(err)
		res.status(400).send( 'error' : 'Some error...' + err)

# start server
app.listen 3030, ( ) ->
	console.log "Server started, listen on port #{app.get('port')}"
	console.log config
	console.log process.env.PWD

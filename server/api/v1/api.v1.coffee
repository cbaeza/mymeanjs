
UserCtrl = require('../../controllers/users/user.ctrl')

module.exports = ( app ) ->

	app.get( '/users', UserCtrl.select )
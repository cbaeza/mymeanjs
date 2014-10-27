
api = require('../api/v1/api.v1')

module.exports = ( app ) ->

	# default view
	app.get '*', (req, res) ->
		res.render 'index'

	return api(app)

module.exports = ( app ) ->

	# default view
	app.get '*', (req, res) ->
		res.render 'index'

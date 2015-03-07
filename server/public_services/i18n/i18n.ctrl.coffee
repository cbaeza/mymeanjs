# i18n Controller

Model = require('./i18n.mdl')
_ = require('lodash')

module.exports = 

	getKeys : ( req, res ) ->
		# TODO
		lang = req.query.lang
		console.log lang
		res.json('i18n')
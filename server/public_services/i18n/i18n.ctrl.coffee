# i18n Controller

i18nModel = require('./i18n.mdl')
_ = require('lodash')

module.exports =

	getKeys : ( req, res ) ->
		# TODO
		_lang = req.query.lang
		console.log _lang

		i18nModel.findOne( {lang : _lang}, (error, result ) ->
			console.log result
			console.log error
			return res.status(400).json({ 'error' : error }) if error
			return res.status(200).send( 'message' : 'not language found' ) if not result
			return res.status(200).send( result )
		)

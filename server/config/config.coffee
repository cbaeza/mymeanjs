module.exports =
	development:
		port: 	process.env.PORT || 3030
		db:		'mongodb://'

	production:
		port:	process.env.PORT || 80
		db:		'mongodb://'
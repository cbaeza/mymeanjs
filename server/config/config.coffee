module.exports =
	development:
		port		: process.env.PORT || 3030
		db			: 'mongodb://localhost/mymean'
		secret 		: 'My-Mean-Secret'
		api_route	: '/api/*'

	production:
		port		: process.env.PORT || 80
		db			: 'mongodb://'
		secret 		: 'My-Mean-Secret'
		api_route	: '/api/*'
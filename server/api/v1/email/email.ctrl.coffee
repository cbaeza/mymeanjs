# controller to send emails

PWD = process.env.PWD

emailServer = require("#{PWD}/server/config/emailjs")
jade		= require('jade')
fs			= require('fs')


module.exports =

	sendEmail: ( req, res ) ->
		#console.log('sending email...')
		data = req.body
		#console.log(data)

		_tpl = "#{PWD}/server/views/mail_templates/merry_christmas.tpl.jade"
		parameters =
			title: 		data.title
			greeting: 	data.greeting

		fs.readFile _tpl, 'UTF8', ( err, template ) ->
			return console.log( err ) if err

			_html = jade.compile( template )(parameters)
			console.log _html

			_message = {
				text:		data.text
				from:		data.from
				to:			data.to
				cc:			data.cc
				subject:	data.subject
				attachment:
					[
						{data: _html, alternative:true}
						#{path:"#{PWD}/server/views/mail_templates/attachments/DSC_0049.JPG", type:"image/jpg", name:"carlos_franca.jpg"}
					]
			}

			emailServer.send _message, ( err, message ) ->
				console.log(err || message)
				return res.status(500).json( 'error' : err ) if err
				return res.status(200).send(message)

	sendAccountVerificationEmail: ( req, res, user ) ->
		console.log "sendAccountVerificationEmail..."
		console.log user

		_tpl = "#{PWD}/server/views/mail_templates/verify_account.tpl.jade"

		parameters =
			title 		: 'Welcome'
			verifylink 	: 'http://localhost:3030/account/verify?token=' + user.token
			linklabel	: 'verify account please'

		fs.readFile _tpl, 'UTF8', ( err, template ) ->
			return console.log( err ) if err

			_html = jade.compile( template )(parameters)
			console.log _html

			_message = {
				text:		'Verification email'
				from:		'enterprise@e.com'
				to:			user.email
				#cc:		''
				subject:	'Welcome to mymeanjs'
				attachment:
					[
						{data: _html, alternative:true}
						#{path:"#{PWD}/server/views/mail_templates/attachments/DSC_0049.JPG", type:"image/jpg", name:"carlos_franca.jpg"}
					]
			}

			emailServer.send _message, ( err, message ) ->
				console.log(err || message)
				return res.status(500).json( 'error' : err ) if err
				return res.status(200).send(message)

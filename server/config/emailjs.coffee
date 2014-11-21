email = require('emailjs')

server  = email.server.connect({
	user:       "YOUR_EMAIL"
	password:   "YOUR_PASSWORD"
	host:       "SMTP_URL"
	#port: 25
	ssl:        false
	#tls: {ciphers: "SSLv3"}
})

module.exports = server
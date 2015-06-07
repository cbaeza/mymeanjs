chai = require('chai')
expect = chai.expect
request = require('request')

ENDPOINT = 'http://localhost:3030/public_services/i18n'

describe 'i18n api', ->
	it 'should return labels for a language de_DE', (done) ->
		request {
			method: 'GET'
			uri: "#{ENDPOINT}?lang=de_DE"
		}, (err, res, body) ->
			expect( err ).to.equal null
			expect( res.statusCode ).to.equal( 200 )
			labels = JSON.parse( body )

			expect( labels ).to.be.instanceof(Object)
			expect( labels ).not.to.be.empty

			done()

	it 'should return labels for a language en_GB', (done) ->
		request {
			method: 'GET'
			uri: "#{ENDPOINT}?lang=en_GB"
		}, (err, res, body) ->
			expect( err ).to.equal null
			expect( res.statusCode ).to.equal( 200 )
			labels = JSON.parse( body )

			expect( labels ).to.be.instanceof(Object)
			expect( labels ).not.to.be.empty

			done()

	it 'should return labels for a language es_ES', (done) ->
		request {
			method: 'GET'
			uri: "#{ENDPOINT}?lang=es_ES"
		}, (err, res, body) ->
			expect( err ).to.equal null
			expect( res.statusCode ).to.equal( 200 )
			labels = JSON.parse( body )

			expect( labels ).to.be.instanceof(Object)
			expect( labels ).not.to.be.empty

			done()

	it 'should return labels for a language en_US', (done) ->
		request {
			method: 'GET'
			uri: "#{ENDPOINT}?lang=en_US"
		}, (err, res, body) ->
			expect( err ).to.equal null
			expect( res.statusCode ).to.equal( 200 )
			labels = JSON.parse( body )

			expect( labels ).to.be.instanceof(Object)
			expect( labels ).not.to.be.empty

			done()

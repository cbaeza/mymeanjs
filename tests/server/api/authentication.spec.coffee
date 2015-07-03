chai = require('chai')
expect = chai.expect
assert = require('chai').assert
request = require('request')

ENDPOINT = 'http://localhost:3030/auth'

credentials =
	email: 'carlos.baeza@posteo.de'
	password: 'c79c6f489015e0bc97f892e357db7156'
	rememberMe: true

describe 'authenticate valid user', ->
	it 'should return user and token', (done) ->
		request {
			method: 'POST'
			uri: "#{ENDPOINT}/login"
			headers:
				'Content-Type': 'application/json;charset=UTF-8'
			body: JSON.stringify(credentials)
		}, (err, res, body) ->
			#console.log( err )
			#console.log( res )
			#console.log( body )
			expect( err ).to.equal null
			expect( res.statusCode ).to.equal( 200 )

			result = JSON.parse( body )
			#console.log( result )

			expect( result ).not.to.be.empty

			expect( result ).to.have.property('user')
			expect( result.user ).not.to.be.empty

			expect( result.user ).to.have.property('token')
			expect( result.user.token ).not.to.be.empty

			expect( result.user ).to.have.property('_id')
			expect( result.user._id ).not.to.be.empty

			expect( result.user ).to.have.property('name')
			expect( result.user.name ).not.to.be.empty

			expect( result.user ).to.have.property('lastname')
			expect( result.user.lastname ).not.to.be.empty

			expect( result.user ).to.have.property('email')
			expect( result.user.email ).not.to.be.empty

			expect( result.user ).to.have.property('roles')
			expect( result.user.roles ).not.to.be.empty

			expect( result.user ).to.have.property('creationDate')
			expect( result.user.creationDate ).not.to.be.empty

			done()

describe 'de authenticate valid user', ->
	it 'should return 200', (done) ->
		request {
			method: 'POST'
			uri: "#{ENDPOINT}/logout"
		}, (err, res, body) ->
			#console.log( err )
			#console.log( res )
			#console.log( body )
			expect( err ).to.equal null
			expect( res.statusCode ).to.equal( 200 )
			done()
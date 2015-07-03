
Profile =  require('./profile.mdl')

module.exports =

	getProfile : ( req, res ) ->
		q = req.params.id
		#console.log(q)
		# check if id is id
		checkForHexRegExp = new RegExp("^[0-9a-fA-F]{24}$")
		# case insensitive query
		r = new RegExp('^' + q  + '$', "i")

		if checkForHexRegExp.test(q)
			query = { $or : [ { _id : q }, { userid : q }, { email : r }, { name : r }, { lastname : r } ] }
		else
			query = { $or : [ { email : r }, { name : r }, { lastname : r } ] }

		#console.log(query)
		Profile.findOne( query, ( error, result ) ->
			return res.status(400).json({ 'error' : error }) if error
			return res.status(200).send( 'message' : 'not profile found' ) if not result
			return res.status(200).send( result )
		)


	createProfile : ( req, res ) ->
		# create profile for verified user
		profile =  new Profile( req.body )
		console.log(profile)

		profile.save( ( error ) ->
			return res.status(400).json({ 'error' : error }) if error
			return res.status(200).send( profile )
		)
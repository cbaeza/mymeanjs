
Profile =  require('./profile.mdl')

ProfileModel = new Profile()

module.exports =

	getProfile : ( req, res ) ->
		q = req.param.id
		console.log(q)
		Profile.findOne( q, ( error, result ) ->
			return res.status(400).json({ 'error' : error }) if error
			return res.status(200).send( 'message' : 'not profile found' ) if not result
			return res.status(200).send( result )
		)
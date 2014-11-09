"use strict";

module.exports = (grunt) ->
	# load all grunt tasks locate in packages.json 'devDependencies' automatically
	require('load-grunt-tasks') (grunt)

	grunt.initConfig
		pkg: grunt.file.readJSON('package.json')

		uglify:
			options:
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'

		build:
			src: 'client/<%= pkg.name %>.js'
			dest: 'dist/<%= pkg.name %>.min.js'

		coffee:
			options:
				bare: true
				join: false
				sourceMap: false

			server:
				expand: true
				flatten: false
				cwd: 'server/'
				src: ['**/*.coffee']
				dest: '.temp/server'
				ext: '.js'

			client:
				expand: true,
				flatten: false,
				cwd: 'client/app',
				src: ['**/*.coffee']
				dest: '.temp/client'
				ext: '.js'

#		replace:
#			# escape single quotes in templates for inclusion
#			escape:
#				src: ['.temp/templates/**/*.html']
#				overwrite: 	true
#				replacements: [
#					from: 	new RegExp("'", "g" ) #/' / g
#					to: 		"\\'"
#				]

		jade:
			# compile client templates includes for routes, directives, dialogs ...
			templates:
				cwd: 	'client/'
				src: 	['**/*.tpl.jade','!**/*.inl.tpl.jade']
				dest: 	'public/partials'
				expand: true
				ext: 	'.html'

			inline:
				cwd: 	'client/'
				src: 	'**/*.inl.tpl.jade'
				dest: 	'.temp/client'
				expand: true
				ext: 	''

		includes:
			files:
				cwd: 'client/app/styles'
				src: "**/*"
				dest: "public/css"

			inline:
				options:
					includeRegexp: /['"]\[\[([^'"]+)\]\]['"]/
					debug: true
				files: [ '.temp/client/clientapp.js' : '.temp/client/clientapp.js' ]

		concat:
			options:
				separator: ';'

			# concatenate all modules
			all:
				src: [
					'.temp/client/app.js'
					'.temp/client/MainClientController.js'
					'.temp/client/js/modules/**/*.js'
				]
				dest: '.temp/client/clientapp.js'

		copy:
			scripts:
				files: ['public/clientapp.js' : '.temp/client/clientapp.js']

		watch:
			clientApp:
				files: [ 'client/**/*.coffee', 'client/**/*.jade', 'client/app/styles/**/*' ]
				tasks: [ 'build-client' ]
				options:
					livereload: true

	grunt
		.registerTask('default', ['uglify'])
		.registerTask( 'client-watch', [ 'watch:clientApp' ])
		.registerTask( 'build-client', [
			#'compass:dist'
			'jade:inline'
			'jade:templates'
			'coffee:client'
			'concat:all'
			#'replace:escape'
			'includes:files'
			'includes:inline'
			'copy:scripts'
		])

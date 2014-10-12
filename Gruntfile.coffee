"use strict";

module.exports = (grunt) ->
	# load all grunt tasks locate in packages.json 'devDependencies' automatically
	require('load-grunt-tasks')(grunt)

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

		replace:
			# escape single quotes in templates for inclusion
			escape:
				src: ['.temp/templates/**/*.html']
				overwrite: 	true
				replacements: [
					from: 	new RegExp("'", "g" ) #/'/g
					to:		"\\'"
				]

		jade:
			# compile client templates includes for routes, directives, dialogs ...
			includes:
				cwd: 		'client/app/js/modules'
				src: 		'**/*.tpl.jade'
				dest: 		'.temp/templates'
				expand: 	true
				ext: 		'.html'

			partials:
				cwd: 		'client/app/js/modules'
				src: 		'**/*.tpl.jade'
				dest: 		'public/partials'
				expand: 	true
				ext: 		'.html'

		includes:
			# include templates to routes, directives ...
			templates:
				options:
					includeRegexp: /['"]\[\[([^'"]+)\]\]['"]/
					debug: true
				files:
					"public/js/app.js" : ".temp/app.js"

		concat:
			options:
				separator: ';'
			scripts:
				src: 	[
					'.temp/client/app.js'
					'.temp/client/**/*.js'
				]
				dest: 	'.temp/app.js'

	grunt
		.registerTask('default', ['uglify'])
		.registerTask( 'build-client', [
			#'compass:dist'
			'jade'
			'coffee:client'
			'concat:scripts'
			'replace:escape'
			'includes:templates'
		])

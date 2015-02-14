module.exports = (grunt) ->

	grunt.initConfig
		pkg: grunt.file.readJSON("package.json")

		nunjucks:
			precompile:
				src: ["app/dev/**/*.html", "!app/dev/templates/index.html", "!app/dev/vendor/**/*.html"]
				dest: "app/dev/templates/templates.js"

		browserify:
			app:
				src: ["app/dev/**/*.coffee", "app/dev/templates/templates.js"]
				dest: "app/build/scripts/app.js"
				options:
					extensions: [".coffee"]
					transform: ["coffeeify", "debowerify"]
					browserifyOptions:
						debug: true
					watch: true

		sass:
			build:
				options:
					sourcemap: true
				files:
					"app/build/stylesheets/app.css": "app/dev/stylesheets/app.scss"

		concat:
			build:
				dest: "app/build/stylesheets/app.css"
				src: ["app/dev/vendor/semantic/dist/semantic.css", "app/build/stylesheets/app.css"]

		connect:
			build:
				options:
					livereload: true
					port: 9000
					base: "app/build"

		clean: ["app/build"]

		injector:
			options:
				addRootSlash: false
				template: "app/dev/templates/index.html"
			build:
				options:
					ignorePath: "app/build/"
				files:
					"app/build/index.html": ["app/build/scripts/vendor.js", "app/build/scripts/app.js", "app/build/stylesheets/app.css"]

		asset_cachebuster:
			options:
				buster: Date.now()
			build:
				files:
					"app/build/index.html":["app/build/index.html"]

		copy:
			build:
				files: [
					{expand: true, cwd: "app/dev/vendor/components-font-awesome/fonts/", src: ["**"], dest: "app/build/fonts"}
					{expand: true, cwd: "app/dev/images/", src: ["**"], dest: "app/build/images"}
				]

		uglify:
			release:
				files: 'app/release/scripts/app.min.js': ['app/build/scripts/vendor.js', 'app/build/scripts/app.js']

		cssmin:
			release:
				files:
					"app/release/stylesheets/app.min.css": [
						"app/release/stylesheets/app.min.css"
					]
				options:
					keepSpecialComments: 0

		watch:
			build_js:
				files: [
					"app/build/scripts/app.js"
				]
				tasks: []
				options:
					livereload: true
			build_css:
				files: [
					"app/dev/**/*.scss"
				]
				tasks: ["sass:build", "concat:build"]
				options:
					livereload: true
			build_templates:
				files: [
					"app/dev/**/*.html"
				]
				tasks: ["nunjucks", "injector"]

		focus:
			build:
				include: ["build_templates", "build_js", "build_css"]

		shell:
			gettext:
				command: "find app/dev/templates/  app/dev/scripts/ -iname '*.html' -o -iname '*.coffee' | xargs xgettext --language=Python --from-code=utf-8 -c -o app/dev/locale/messages.pot"
				options:
					stdout: true
					stderr: true
			msgmerge_de_DE:
				command: "msgmerge de_DE/LC_MESSAGES/messages.po messages.pot -o de_DE/LC_MESSAGES/messages.po"

				options:
					execOptions:
						cwd: "app/dev/locale/"
					stdout: true
					stderr: true


		grunt.registerTask "po2json", ->
			po2json = require("po2json")
			for locale in ["de_DE"]
				json_data = po2json.parseFileSync "app/dev/locale/#{locale}/LC_MESSAGES/messages.po", format: "jed"
				grunt.file.write("app/dev/locale/#{locale}/LC_MESSAGES/messages.json", JSON.stringify(json_data))

		require('load-grunt-tasks')(grunt)

		grunt.registerTask "default", [
			"clean",
			"nunjucks"
			"browserify:app",
			"sass:build",
			"concat:build",
			"injector:build",
			"copy:build",
			"connect:build",
			"focus:build"
		]
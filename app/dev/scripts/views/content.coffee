BaseView = require("./base.coffee")
ProfileModel = require("../models/profile.coffee")

###
	ContentView extends from BaseView
	shares base functionality like 
	- rendering main content template files
	exports singleton
###
class ContentView extends BaseView
	template_path: "app/dev/templates/"
	show: (template) ->
		window.jQuery(@regions.content).html(@render(@template_path + template, profile: ProfileModel))
		@position_footer()

module.exports = new ContentView()
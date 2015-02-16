BaseView = require("./base.coffee")
ProfileModel = require("../models/profile.coffee")
$ = require("jquery")

class ContentView extends BaseView
	template: "app/dev/templates/main.html"
	show: () ->
		$(@regions.content).html(@render(@template, profile: ProfileModel))
		@position_footer()

module.exports = new ContentView()
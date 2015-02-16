BaseView = require("./base.coffee")
$ = require("jquery")
ProfileModel = require("../models/profile.coffee")

class ProfileView extends BaseView
	template: "app/dev/templates/profile.html"
	show: (el) ->
		$(@regions.content).html(@render(@template, profile: ProfileModel))
		@position_footer()
module.exports = new ProfileView()
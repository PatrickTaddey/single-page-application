BaseView = require("./base.coffee")
ProfileModel = require("../models/profile.coffee")
$ = require("jquery")
class MenuView extends BaseView
	template: "app/dev/templates/menu.html"
	show: () ->
		$(@regions.menu).html(@render(@template, profile: ProfileModel))
		$(document).foundation()
		
module.exports = new MenuView()
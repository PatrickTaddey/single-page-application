BaseView = require("./base.coffee")
ProfileModel = require("../models/profile.coffee")
$ = require("jquery")
Helper = require("../utils/helper.coffee")

###
	MenuView extends from BaseView
	- just rendering the menu
	exports singleton
###
class MenuView extends BaseView
	site: null
	template: "app/dev/templates/menu.html"
	events:
		# activate menu item after click
		"click a" : (event) -> 
			$("li", @$el).removeClass("active")
			$(event.currentTarget).closest("li").addClass("active")
			if($(event.currentTarget).closest("ul").hasClass("dropdown"))
				$(event.currentTarget).closest("ul").closest("li.has-dropdown").addClass("active")
	initialize: ->
		@$el = $(@regions.menu)
		
	show: () ->
		$(@$el).html(@render(@template, profile: ProfileModel, site: Helper.get_site()))
		$(document).foundation()
		
module.exports = new MenuView()
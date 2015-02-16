BaseView = require("./base.coffee")
ProfileModel = require("../models/profile.coffee")
$ = require("jquery")
class MenuView extends BaseView
	template: "app/dev/templates/menu.html"
	events:
		"click a" : (event) -> 
			$("li", @$el).removeClass("active")
			$(event.currentTarget).closest("li").addClass("active")
			if($(event.currentTarget).closest("ul").hasClass("dropdown"))
				$(event.currentTarget).closest("ul").closest("li.has-dropdown").addClass("active")
	initialize: ->
		@$el = $(@regions.menu)
	show: () ->
		$(@$el).html(@render(@template, profile: ProfileModel))
		$(document).foundation()
		
module.exports = new MenuView()
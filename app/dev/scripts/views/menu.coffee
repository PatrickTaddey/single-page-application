BaseView = require("./base.coffee")
ProfileModel = require("../models/profile.coffee")
$ = require("jquery")
class MenuView extends BaseView
	site: null
	template: "app/dev/templates/menu.html"
	events:
		"click a" : (event) -> 
			$("li", @$el).removeClass("active")
			$(event.currentTarget).closest("li").addClass("active")
			if($(event.currentTarget).closest("ul").hasClass("dropdown"))
				$(event.currentTarget).closest("ul").closest("li.has-dropdown").addClass("active")
			$('body').trigger('touchstart')
	initialize: ->
		@$el = $(@regions.menu)
		hostname = window.location.hostname
		@site = hostname.split(".")?[0]
	show: () ->
		$(@$el).html(@render(@template, profile: ProfileModel, site: @site))
		$(document).foundation('topbar', 'reflow')
		
module.exports = new MenuView()
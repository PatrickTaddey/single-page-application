$ = require("jquery")
Backbone = require("backbone")
_ = require("underscore")

###
	class Helper 
	- position footer and jump to top
	- show alert messages in the contact form
	- get site to display the logo in menu
	- handle routing - set active element in menu
	exports singleton
###
class Helper

	# position footer and jump to top
	position_footer:()->
		window_height = $(window).height()
		wrapper_height = $(".wrapper").height()
		buffer_height = window_height - wrapper_height + 39
		if window_height > wrapper_height
			$(".content-area").css("padding-bottom", buffer_height + "px")
		$(window).scrollTop(0)

	# show alert messages in the contact form
	show_alert:(alert_class, alert_message)->
		$(".alert-box").removeClass("hide")
		.addClass(alert_class)
		.find(".js-alert-message").text(alert_message)
		$(document).foundation('alert', 'reflow')

	# get site to display the logo in menu
	get_site:()->
		hostname = window.location.hostname
		if hostname.split(".")?[0] is "www" then hostname.split(".")?[1] else hostname.split(".")?[0]

	# handle routing - set active element in menu
	handle_routing:(route, params) ->
		$("nav li").removeClass("active")
		element = $('a[href~="#' + route.split('(')[0] + '"]')
		element.parent().addClass("active")
		if element.closest("ul").hasClass("dropdown")
			element.closest("li.has-dropdown").addClass("active")

	track_ga: () ->
		try
			ga('send', 'pageview', 
				page: Backbone.history.getFragment()
			)
		catch error
			console.log "google analytics script failed - " + error
module.exports = new Helper()
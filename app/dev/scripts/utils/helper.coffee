$ = require("jquery")
_ = require("underscore")

###
	class Helper 
	- position footer and jump to top
	- show alert messages in the contact form
	exports singleton
###
class Helper
	position_footer:()->
		window_height = $(window).height()
		wrapper_height = $(".wrapper").height()
		buffer_height = window_height - wrapper_height + 39
		if window_height > wrapper_height
			$(".content-area").css("padding-bottom", buffer_height + "px")
		$(window).scrollTop(0)
		
	show_alert:(alert_class, alert_message)->
		$(".alert-box").removeClass("hide")
		.addClass(alert_class)
		.find(".js-alert-message").text(alert_message)
		$(document).foundation('alert', 'reflow')

	get_site:()->
		hostname = window.location.hostname
		return hostname.split(".")?[0]

module.exports = new Helper()
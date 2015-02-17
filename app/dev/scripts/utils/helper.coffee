$ = require("jquery")
_ = require("underscore")
class Helper
	position_footer:()->
		window_height = $(window).height()
		wrapper_height = $(".wrapper").height()
		buffer_height = window_height - wrapper_height + 39
		if window_height > wrapper_height
			$(".content-area").css("padding-bottom", buffer_height + "px")
	show_alert:(alert_class, alert_message)->
		$(".alert-box").removeClass("hide")
		.addClass(alert_class)
		.find(".js-alert-message").text(alert_message)
		$(document).foundation('alert', 'reflow')

module.exports = new Helper()
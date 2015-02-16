BaseView = require("./base.coffee")
ProfileModel = require("../models/profile.coffee")
$ = require("jquery")

class LegalNoticeView extends BaseView
	template: "app/dev/templates/legal_notice.html"
	show: () ->
		$(@regions.content).html(@render(@template, profile: ProfileModel))
		@position_footer()

module.exports = new LegalNoticeView()
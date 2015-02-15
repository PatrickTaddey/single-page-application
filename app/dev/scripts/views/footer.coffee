BaseView = require("./base.coffee")
ProfileModel = require("../models/profile.coffee")
$ = require("jquery")
class FooterView extends BaseView
	template: "app/dev/templates/footer.html"
	show: () ->
		$(@regions.footer).html(@render(@template, profile: ProfileModel))
		
module.exports = new FooterView()
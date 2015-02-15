Backbone = require("backbone")
require("routefilter")
$ = require("jquery")
Backbone.$ = window.$
MenuView = require("./views/menu.coffee")
FooterView = require("./views/footer.coffee")
MainView = require("./views/main.coffee")
ProfileView = require("./views/profile.coffee")
SkillsView = require("./views/skills.coffee")
ProfileModel = require("./models/profile.coffee")
ContactView = require("./views/contact.coffee")
LegalNoticeView = require("./views/legal_notice.coffee")
class AppRouter extends Backbone.Router
	routes :
		"" : "index"
		"profile" : "profile"
		"skills" : "skills"
		"experiences" : "experiences"
		"contact" : "contact"
		"legal_notice" : "legal_notice"
	initialize: () ->
		ProfileModel.fetch
			success: (model, response, options) =>
				MenuView.show()
				FooterView.show()
				Backbone.history.start()
	index: () ->
		MainView.show()
	profile: () ->
		ProfileView.show()
	skills: () ->
		SkillsView.show()
	contact: () ->
		ContactView.show()
	legal_notice: () ->
		LegalNoticeView.show()
		
module.exports = new AppRouter()

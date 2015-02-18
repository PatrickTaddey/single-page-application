Backbone = require("backbone")

# require views & models
MenuView = require("./views/menu.coffee")
FooterView = require("./views/footer.coffee")
ContentView = require("./views/content.coffee")
SkillsView = require("./views/skills.coffee")
ContactView = require("./views/contact.coffee")

# export a singleton of the ProfileModel
ProfileModel = require("./models/profile.coffee")

# AppRouter: exports a singleton
class AppRouter extends Backbone.Router
	routes :
		"" : "index"
		"profile" : "profile"
		"skills" : "skills"
		"experiences" : "experiences"
		"contact(/:buy)" : "contact"
		"legal_notice" : "legal_notice"
		"*undefined" : "content"

	# we have to fetch the ProfileModel once
	initialize: () ->
		ProfileModel.fetch
			success: (model, response, options) =>
				MenuView.show()
				FooterView.show()
				Backbone.history.start()
	index: () ->
		ContentView.show("main.html")
	profile: () ->
		ContentView.show("profile.html")
	legal_notice: () ->
		ContentView.show("legal_notice.html")
	content: () ->
		ContentView.show("404.html")
	skills: () ->
		SkillsView.show()
	contact: (buy) ->
		ContactView.show(buy)

# export a singleton of the AppRouter
module.exports = new AppRouter()
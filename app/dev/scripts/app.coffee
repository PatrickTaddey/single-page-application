Backbone = require("backbone")
require("backbone.routefilter")
Helper = require("./utils/helper.coffee")

# require views & models
MenuView = require("./views/menu.coffee")
FooterView = require("./views/footer.coffee")
ContentView = require("./views/content.coffee")
SkillsView = require("./views/skills.coffee")
DomainsView = require("./views/domains.coffee")
ContactView = require("./views/contact.coffee")

# export a singleton of the ProfileModel
ProfileModel = require("./models/profile.coffee")

###
	AppRouter extends from Backbone.Router
	- fetch ProfileModel in initializer
	- handle routing
	- display views
	exports a singleton
###
class AppRouter extends Backbone.Router
	routes :
		"" : "index"
		"profile" : "profile"
		"skills" : "skills"
		"experiences" : "experiences"
		"contact(/:domain)" : "contact"
		"legal_notice" : "legal_notice"
		"domains" : "domains"
		"*undefined" : "content"

	# we have to fetch the ProfileModel once
	initialize: () ->
		ProfileModel.fetch
			success: (model, response, options) =>
				MenuView.show()
				FooterView.show()
				Backbone.history.start()
	# handle routing - set active element in menu
	before: (route, params) ->
		Helper.handle_routing(route, params)
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
	domains: () ->
		DomainsView.show()
	contact: (domain) ->
		ContactView.show(domain)

# export a singleton of the AppRouter
module.exports = new AppRouter()
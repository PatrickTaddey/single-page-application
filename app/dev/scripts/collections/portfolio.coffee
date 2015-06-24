$ = require("jquery")
Backbone = require("backbone")
Backbone.$ = $
ConfigModel = require("../models/config.coffee")

###
	PortfolioCollection extends from Backbone.Collection
	- sharing portfolio data
	exports singleton
###
class PortfolioCollection extends Backbone.Collection
	url: () ->
		ConfigModel.get("api") + "users/patrick/portfolio"
	parse : (response) ->
		return response.data

module.exports = new PortfolioCollection()
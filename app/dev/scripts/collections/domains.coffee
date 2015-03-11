$ = require("jquery")
Backbone = require("backbone")
Backbone.$ = $
ConfigModel = require("../models/config.coffee")

###
	DomainsCollection extends from Backbone.Collection
	- sharing skills data
	exports singleton
###
class DomainsCollection extends Backbone.Collection
	url: () ->
		ConfigModel.get("api") + "users/patrick/domains"
	parse : (response) ->
		return response.data

module.exports = new DomainsCollection()
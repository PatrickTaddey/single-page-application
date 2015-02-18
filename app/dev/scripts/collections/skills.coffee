$ = require("jquery")
Backbone = require("backbone")
Backbone.$ = $
ConfigModel = require("../models/config.coffee")

###
	SkillsCollection extends from Backbone.Collection
	- sharing skills data
	exports singleton
###
class SkillsCollection extends Backbone.Collection
	url: () ->
		ConfigModel.get("api") + "users/patrick/skills"
	parse : (response) ->
		return response.data

module.exports = new SkillsCollection()
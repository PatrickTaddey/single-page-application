$ = require("jquery")
Backbone = require("backbone")
Backbone.$ = $
ConfigModel = require("../models/config.coffee")

class SkillsCollection extends Backbone.Collection
	url: () ->
		ConfigModel.get("api") + "users/patrick/skills"
	parse : (response) ->
		return response.data

module.exports = new SkillsCollection()
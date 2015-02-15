$ = require("jquery")
Backbone = require("backbone")
Backbone.$ = $
i18n = require("../utils/i18n.coffee")

class BaseModel extends Backbone.Model
	parse : (response) ->
		return response.data

module.exports = BaseModel
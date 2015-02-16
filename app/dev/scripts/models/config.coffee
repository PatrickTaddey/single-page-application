BaseModel = require("./base.coffee")
$ = require("jquery")
class ConfigModel extends BaseModel
	defaults:
		api: $("body").attr("data-api") or "//api.megaphones.de/"
module.exports = new ConfigModel()
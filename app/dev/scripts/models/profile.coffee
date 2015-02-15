BaseModel = require("./base.coffee")
ConfigModel = require("./config.coffee")

class ProfileModel extends BaseModel
	urlRoot: () ->
		ConfigModel.get("api") + "users/patrick/profile"
module.exports = new ProfileModel()
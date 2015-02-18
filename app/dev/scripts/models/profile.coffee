BaseModel = require("./base.coffee")
ConfigModel = require("./config.coffee")

###
	ProfileModel extends from BaseModel
	- sharing profile data
	exports singleton
###
class ProfileModel extends BaseModel
	urlRoot: () ->
		ConfigModel.get("api") + "users/patrick/profile"
module.exports = new ProfileModel()
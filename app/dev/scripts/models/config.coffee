BaseModel = require("./base.coffee")

class ConfigModel extends BaseModel
	defaults:
		#api: "http://localhost:8080/api/"
		api: "http://api.test.de/"
module.exports = new ConfigModel()
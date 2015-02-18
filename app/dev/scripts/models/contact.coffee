BaseModel = require("./base.coffee")
ConfigModel = require("./config.coffee")
i18n = require("../utils/i18n.coffee")

###
	ContactModel extends from BaseModel
	- form validation, sharing contact data
	exports singleton
###
class ContactModel extends BaseModel
	urlRoot: () ->
		ConfigModel.get("api") + "contacts"

	validation:
		name:
			required: true
			minLength: 3
			maxLength: 255
			format: /^([a-zA-Z]+\s)*[a-zA-Z]+$/
			message: i18n.gettext("Please enter your name")
		email:
			required: true
			format: "email"	
			message: i18n.gettext("Please enter your email")
		offer:
			format: "number"	
			message: i18n.gettext("Please enter a valid offer")
		message:
			required: true
			minLength: 3
			maxLength: 255
			message: i18n.gettext("Please enter a message")

module.exports = new ContactModel()
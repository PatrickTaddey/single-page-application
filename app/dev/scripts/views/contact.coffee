BaseView = require("./base.coffee")
ĈontactModel = require("../models/contact.coffee")
ProfileModel = require("../models/profile.coffee")
Helper = require("../utils/helper.coffee")

$ = require("jquery")
Backbone = require("backbone")
require("backbone-validator")
require("jquery-serialize-object")

class ContactView extends BaseView
	template: "app/dev/templates/contact.html"
	events: 
		"click .close-alert": (event) ->
			event.preventDefault()
			$(".alert-box").addClass("hide")
		"submit #js-contact-form": (event) ->
			event.preventDefault()
			ĈontactModel.set($('form').serializeObject())
			return if !ĈontactModel.isValid()
			ĈontactModel.save null,
				success: (model, response, options) =>
					Helper.show_alert("success", @gettext("Mail sent"))
				error: (model, response, options) =>
					Helper.show_alert("warning", @gettext("Mail not sent"))

		"blur .js-form-field": (event) ->
			name = $(event.target).attr("name")
			value = $(event.target).val()
			ĈontactModel.set(name, value).validate(name)


	initialize: ->
		@$el = $(@regions.content)
		@bindValidation(ĈontactModel)

	show: (buy) ->
		$(@$el).html(@render(@template, profile: ProfileModel, buy: buy))
		@position_footer()
		$(document).on 'close.fndtn.alert', (event) ->
			console.info('An alert box has been closed!')

	onValidField: (attrName, attrValue, model) ->
		element = $('[name=' + attrName + ']')
		element.parent().removeClass("error")
		element.parent().next("small").addClass("hide")

	onInvalidField: (attrName, attrValue, errors, model) ->
		element = $('[name=' + attrName + ']')
		element.parent().addClass("error")
		element.parent().next("small").html(errors).removeClass("hide")

module.exports = new ContactView()
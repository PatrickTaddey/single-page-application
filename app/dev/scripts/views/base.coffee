$ = require("jquery")
Backbone = require("backbone")
Backbone.$ = $
i18n = require("../utils/i18n.coffee")

class BaseView extends Backbone.View
	regions:
		menu: "#js-menu-region"
		content: "#js-content-region"
		footer: "#js-footer-region"
	render:(template, context) ->
		i18n.render(template, context)
	gettext:(string) ->
		i18n.gettext(string)
	destroy: (view) ->
		view.undelegateEvents()
		$(view.el).empty()			
module.exports = BaseView
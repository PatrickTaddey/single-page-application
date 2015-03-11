BaseView = require("./base.coffee")
$ = require("jquery")
DomainsCollection = require("../collections/domains.coffee")

###
	DomainsView extends from BaseView
	- loads the domains-collection from the api
	exports singleton
###
class DomainsView extends BaseView
	template: "app/dev/templates/domains.html"

	initialize:() ->
		@$el = $(@regions.content)
	show: () =>
		DomainsCollection.fetch
			success: (collection, response, options) =>
				$(@$el).html(@render(@template, domains: collection.models))
				@position_footer()
				$(document).foundation
					equalizer:
						equalize_on_stack: true




module.exports = new DomainsView()
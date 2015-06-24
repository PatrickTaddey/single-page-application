BaseView = require("./base.coffee")
$ = require("jquery")
PortfolioCollection = require("../collections/portfolio.coffee")

###
	PortfolioView extends from BaseView
	- loads the portfolio-collection from the api
	exports singleton
###
class PortfolioView extends BaseView
	template: "app/dev/templates/portfolio.html"
	initialize:() ->
		@$el = $(@regions.content)
	show: () =>
		PortfolioCollection.fetch
			success: (collection, response, options) =>
				$(@$el).html(@render(@template, portfolio: collection.models))
				@position_footer()

module.exports = new PortfolioView()
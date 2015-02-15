BaseView = require("./base.coffee")
$ = require("jquery")
SkillsCollection = require("../collections/skills.coffee")

class SkillsView extends BaseView
	template: "app/dev/templates/skills.html"
	events:
		"click .js-skill-filter" : (event) =>
			event.preventDefault()
			$(".js-skill-filter").removeClass("active")
			$(event.currentTarget).addClass("active")
			data_class = $(event.currentTarget).attr("data-class")
			$(".js-skill:not(" + data_class + ")").fadeTo("fast", 0.3)
			$(data_class).fadeTo("fast", 1)

	initialize:() ->
		@$el = $(@regions.content)
	show: () =>
		SkillsCollection.fetch
			success: (collection, response, options) =>
				collection.comparator = (model) ->
					return model.get('name')
				collection.sort()
				$(@$el).html(@render(@template, skills: collection.models))
				$(document).foundation('dropdown', 'reflow')

module.exports = new SkillsView()
BaseView = require("./base.coffee")
$ = require("jquery")
SkillsCollection = require("../collections/skills.coffee")

class SkillsView extends BaseView
	template: "app/dev/templates/skills.html"
	events:
		"click .js-skill-filter" : (event) =>
			event.preventDefault()
			if $(event.currentTarget).hasClass("skiller")
				skill_name = $(event.currentTarget).attr("data-name")
				$("#js-skill-choice").text(skill_name)
			else
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
				skill_types = []
				collection.comparator = (model) =>
					if model.get('class') not in skill_types
						skill_types.push model.get('class')
					return model.get('name')
				collection.sort()
				$(@$el).html(@render(@template, skills: collection.models, skill_types: skill_types))
				$(document).foundation('dropdown', 'reflow')
				@position_footer()

module.exports = new SkillsView()
testr = require('./testr')

#testr.run require('./script').script

testr.run ->
	@goTo 'http://www.google.com'

	@set 'query.input', 'webdriver'
	@set 'button.search'
	
	@wait =>
		@getTitle().then (title) ->
			title == 'webdriver - Google zoeken'
	, 3000
	
	@quit()

objects = require './objects'
exports.run = (script) ->
	@wd = webdriver = require 'selenium-webdriver'
	@ui = driver = new @wd.Builder().
	withCapabilities(@wd.Capabilities.chrome()).
	build()

	@set = (el, val) ->
		if typeof el == 'string'
			@set @_(el), val
		else
			@elements(el).then (element) => element.set val
			
	@with = (findType) -> webdriver.By[findType]
	@find = (locatorType, locatorValue) => driver.findElement @with(locatorType) locatorValue
	@_ = (key) => @find objects[key].locator, objects[key].value
	
	@wait = (func, interval) -> driver.wait func, interval
	@getTitle = -> driver.getTitle()

	@goTo = (url) -> driver.get url
	@quit = -> driver.quit()
	
	if typeof script == 'function'
		script.call @
	else
		for step in script
			do (step) =>
				if @keywords[step.keyword]
					@keywords[step.keyword] step.arguments
				else 
					@[step.keyword] step.arguments

@elements = (el) =>
	el.getTagName().then (tag) =>
		switch tag
			when 'input', 'textbox'
				set: (val) => 
					el.clear()
					el.sendKeys val
				get: => el.getText()
			when 'button'
				set: => el.click()
				get: => el.getAttribute 'value' 
			
@keywords =
	'go to': (args) =>	@goTo args.url
	
	'fill in': (args) => @set k, v for k, v of args
	
	'check the title': (args) => 
		@wait =>
			@getTitle().then (title) =>
				title == args.title
		, args.timeout

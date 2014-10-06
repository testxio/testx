exports.script =
	[
		{
		"keyword": "go to",
		"arguments": 
			{"url": "http://www.google.com"}
		},
		{
		"keyword": "fill in",
		"arguments":
			"query.input": "webdriver",
			"button.search": null
		},
		{
		"keyword": "check the title",
		"arguments":
			"title": "webdriver - Google zoeken",
			"timeout": 3000
		},
		{"keyword": "quit"},
	]

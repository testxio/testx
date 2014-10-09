exports.scriptAsJson =
  "ExcelScript":
    "steps": [
      "TestScriptStep":
        "name": "go to"
        "meta": {"Row": "3", "Full name": "go to"}
        "arguments": {"url": "http://www.google.com"},
      "TestScriptStep":
        "name": "fill in"
        "meta": {"Row": "5", "Full name": "fill in"}
        "arguments": {"query.input": "webdriver", "button.search": ""},
      "TestScriptStep":
        "name": "check the title"
        "meta": {"Row": "7", "Full name": "check the title"}
        "arguments": {"title": "webdriver - Google zoeken", "timeout": "3000"},
      "TestScriptStep":
        "name": "quit"
        "meta": {"Row": "9", "Full name": "quit"}
        "arguments": {}
    ]

exports.scriptAsFunc = ->
  @goTo 'http://www.google.com'

  @set 'query.input', 'webdriver'
  @set 'button.search'

  @wait =>
    @getTitle().then (title) ->
      title == 'webdriver - Google zoeken'
  , 3000

  @quit()
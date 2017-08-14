module.exports =
  identity: (v) -> v
  resLink: ->
    locator: 'css'
    value: 'h3.r a'
  orgName:
    locator: 'xpath'
    value: '//h1[contains(@class,"org-name")]'

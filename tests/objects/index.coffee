module.exports =
  identity: (v) -> v
  resLink: (title) ->
    locator: 'xpath'
    value: "(//h3[contains(@class, 'r')]//a[contains(., '#{title}')])[1]"
  orgName:
    locator: 'xpath'
    value: '//h1[contains(@class,"org-name")]'

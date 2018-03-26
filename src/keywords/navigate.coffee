{convertSimpleArgs} = require './api'

module.exports =
  'go to': (args) ->
    args = convertSimpleArgs args, 'url'
    await browser.get args.url
    args.url
  'go forward': ->
    browser.navigate().forward()
  'go back': ->
    browser.navigate().back()
  'refresh page': ->
    browser.navigate().refresh()

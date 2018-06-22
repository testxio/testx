Duration = require 'duration-js'

module.exports =
  'clear local storage': ->
    browser.executeScript 'window.localStorage.clear();'
  'delete cookies': ->
    browser.manage().deleteAllCookies()
  'ignore synchronization': (args) ->
    ignore = if args in [true, 'true', 'yes', '1'] then true else false
    browser.ignoreSynchronization = ignore
  'sleep': (args) ->
    browser.sleep new Duration(args).milliseconds()

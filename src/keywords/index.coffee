path = require 'path'
fs = require 'fs'

_ = require 'lodash'
colors = require 'colors'

{defunc} = require '../libs/utils'
{get, getAll, set, wait, convertSimpleArgs, assertFailedMsg} = require './api'

module.exports =
  add: (kw) -> _.merge keywords, defunc(kw)
  get: ->
    checks = require './check'
    navigates = require './navigate'
    waits = require './wait'
    _.merge keywords, checks, navigates, waits

keywords =
  'get': (keys...) ->
    (get key for key in keys)
  'save': (args, ctx) ->
    save = (v) -> (value) -> ctx[v] = value
    for key, val of args
      do -> (get key).then save(val)
  'put': (args, ctx) ->
    for key, val of args
      do -> ctx[key] = val
  'set': (args) ->
    for key, val of args
      do -> set key, val
  'ignore synchronization': (args) ->
    ignore = if args.ignore in ['true', 'yes', '1'] then true else false
    browser.ignoreSynchronization = ignore
  'sleep': (args) ->
    browser.sleep (args.milliseconds || 0) + 1000 * (args.seconds || 0)
  'switch to': (args) ->
    result = q.defer()
    if args.title
      q.all browser.getAllWindowHandles().then (handles) ->
        _.map handles, (wh) ->
          browser.switchTo().window(wh).then ->
            browser.getTitle().then (t) ->
              title: t
              handle: wh
      .then (titles) ->
        ttls = (t.title for t in titles)
        if args.title not in ttls
          result.reject new Error("Could not find a window with title '#{args.title}'! Known windows are [#{ttls}].")
        else
          for t in titles
            if t.title == args.title
              browser.switchTo().window(t.handle).then -> result.resolve true
    if args.frame
      browser.switchTo().frame(args.frame).then -> result.resolve true
    result.promise
  'run': (args, ctx) ->
    context = _.extend {}, ctx, _.omit(args, ['file'])
    testx.run args.file, context
  'respond to dialog': (args) ->
    dialog = browser.switchTo().alert()
    switch args.response.toLowerCase() # Key should be 'response'
      when "ok" then dialog.accept()
      when "cancel" then dialog.dismiss()
  'send keys': (args) ->
    # Send key strokes to focussed element, supporting specials keys, such as [TAB] and [ENTER].
    # Documentation: http://selenium.googlecode.com/git/docs/api/javascript/enum_webdriver_Key.html
    for key, val of args
      keys = val.replace(/\[\w+\]/g, (match) ->
        protractor.Key[match.substring(1, match.length-1).toUpperCase()])
      browser.actions().sendKeys(keys).perform()

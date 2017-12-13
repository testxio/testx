path = require 'path'
fs = require 'fs'

_ = require 'lodash'
colors = require 'colors'

{defunc, printable, timeout} = require '../libs/utils'

cond  = protractor.ExpectedConditions
DEFAULT_TIMEOUT = -> testx.params.actionTimeout || 5000

assertFailedMsg = (ctx) ->
  "Assertion failure at #{printable _.pick(ctx._meta, 'file', 'sheet', 'Row')}"

get = (key) ->
  testx.element(key).wait(DEFAULT_TIMEOUT()).then -> testx.element(key).get()
getAll = (key) ->
  testx.elements(key).wait(DEFAULT_TIMEOUT()).then -> testx.element(key).get()
set = (key, value) ->
  wait {objects: [key]}, cond.elementToBeClickable
  testx.element(key).set value

wait = (args, condition = cond.visibilityOf) ->
  for obj in args.objects
    (testx.element obj).wait timeout(args.timeout, DEFAULT_TIMEOUT()), condition

convertSimpleArgs = (args, defaultArg) ->
  if Array.isArray args or typeof args isnt 'object'
    arg = args
    args = {}
    args[defaultArg] = arg
  args

module.exports =
  add: (kw) -> _.assign keywords, defunc(kw)
  get: -> keywords

keywords =
  'get': (keys...) ->
    (get key for key in keys)
  'go to': (args) ->
    # args = convertSimpleArgs args, 'url'
    browser.get args.url
  'go forward': ->
    browser.navigate().forward()
  'go back': ->
    browser.navigate().back()
  'refresh page': ->
    browser.navigate().refresh()
  'save': (args, ctx) ->
    save = (v) -> (value) -> ctx[v] = value
    for key, val of args
      do -> (get key).then save(val)
  'put': (args, ctx) ->
    for key, val of args
      do -> ctx[key] = val
  'check equals': (args, ctx) ->
    for key, val of args
      expect(get key).toEqual val, assertFailedMsg(ctx)
  'check not equals': (args, ctx) ->
    for key, val of args
      expect(get key).not.toEqual val, assertFailedMsg(ctx)
  'check matches': (args, ctx) ->
    for key, val of args
      expect(get key).toMatch val, assertFailedMsg(ctx)
  'check not matches': (args, ctx) ->
    for key, val of args
      expect(get key).not.toMatch val, assertFailedMsg(ctx)
  'check exists': (args, ctx) ->
    for key, val of args
      getAll(key).then (values) ->
        if val.toLowerCase() is 'true' or val is ''
          expect(values?.length).toBeTruthy assertFailedMsg(ctx)
        else
          expect(values?.length).toBeFalsy assertFailedMsg(ctx)
  'check enabled': (args, ctx) ->
    for key, val of args
      expectedValue = val.toLowerCase() == 'true'
      expect(testx.element(key).isEnabled()).toBe expectedValue, assertFailedMsg(ctx)
  'check readonly': (args, ctx) ->
    for key, val of args
      expectedValue = if val.toLowerCase() == 'true' then 'true' else null # Note: It returns 'true' as string, not as boolean
      expect(testx.element(key).getAttribute('readonly')).toBe expectedValue, assertFailedMsg(ctx)
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
  wait: (args, ctx) ->
    args = convertSimpleArgs args, 'objects'
    args.to ?= 'appear'
    if args.to is 'appear'
      wait args
    else if args.to is 'disappear'
      # Hack for the 'stale element' exception plague
      acceptableErrors = ['StaleElementReferenceError', 'NoSuchElementError']
      wfs = wait args, cond.invisibilityOf
      for wf in wfs
        wf.catch (err) -> throw err unless err.name in acceptableErrors
    else
      throw
        new Error "Uknown wait condition '#{args.to}'. #{assertFailedMsg ctx}"
  'wait to appear': (args) -> @wait args
  'wait to disappear': (args) ->
    args = convertSimpleArgs args, 'objects'
    args.to = 'disappear'
    @wait args
  'run': (args, ctx) ->
    context = _.extend {}, ctx, _.omit(args, ['file'])
    testx.run args.file, context
  'clear local storage': -> browser.executeScript 'window.localStorage.clear();'
  'delete cookies': -> browser.manage().deleteAllCookies()
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

path = require 'path'
fs = require 'fs'

_ = require 'lodash'
colors = require 'colors'

{defunc, printable} = require '../lib/utils'

DEFAULT_TIMEOUT = -> testx.params.actionTimeout || 5000

get = (key) ->
  testx.element(key).wait(DEFAULT_TIMEOUT()).then -> testx.element(key).get()
getAll = (key) ->
  testx.elements(key).wait(DEFAULT_TIMEOUT()).then -> testx.element(key).get()
set = (key, value) ->
  testx.element(key).wait(DEFAULT_TIMEOUT(), protractor.ExpectedConditions.elementToBeClickable).then ->
    testx.element(key).set value

waitFor = (args, condition = protractor.ExpectedConditions.visibilityOf) ->
  for key, obj of _.omit(args, 'timeout')
    do ->
      (testx.element obj).wait (parseInt(args.timeout) or DEFAULT_TIMEOUT()), condition

module.exports =
  add: (kw) -> _.assign keywords, defunc(kw)
  get: -> keywords

assertFailedMsg = (ctx) ->
  "Assertion failure at #{printable _.pick(ctx._meta, 'file', 'sheet', 'Row')}"

keywords =
  'get': (keys...) ->
    (get key for key in keys)
  'go to': (args) ->
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
      if typeof val == 'string'
        expect(get key).toMatch val, assertFailedMsg(ctx)
      else
        for attrKey, attrVal of val
          expect(testx.element(key).getAttribute(attrKey)).toMatch attrVal.toString(), assertFailedMsg(ctx)

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
  'wait to appear': (args) -> waitFor args
  'wait to disappear': (args) ->
    # Hack for the 'stale element' exception plague
    acceptableErrors = ['StaleElementReferenceError', 'NoSuchElementError']
    wfs = waitFor(args, protractor.ExpectedConditions.invisibilityOf)
    for wf in wfs
      wf.catch (err) ->
        throw err unless err.name in acceptableErrors
  'run': (args, ctx) ->
    context = _.extend {}, ctx, _.omit(args, ['file', 'sheet'])
    if args.sheet
      file = if args.file then args.file else ctx?._meta?.file
      testx.run file, args.sheet, context
    else
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

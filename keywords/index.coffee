_ = require 'lodash'
request = require 'request'
colors = require 'colors'

object = require('../objects').element
runner = require '../lib/runner'
defunc = require('../lib/utils').defunc

DEFAULT_TIMEOUT = -> browser.params.testx.actionTimeout || 5000

get = (key) ->
  object(key).wait DEFAULT_TIMEOUT()
  object(key).get()
set = (key, value) ->
  object(key).wait DEFAULT_TIMEOUT(), protractor.ExpectedConditions.elementToBeClickable
  object(key).set value

waitFor = (args, condition = protractor.ExpectedConditions.visibilityOf) ->
  for key, obj of _.omit(args, 'timeout')
    do =>
      (object obj).wait parseInt(args.timeout), condition

module.exports =
  add: (kw) -> _.assign keywords, defunc(kw)
  get: -> keywords

assertFailedMsg = (ctx) ->
  "Assertion failure at: file '#{ctx._meta.file}', sheet '#{ctx._meta.sheet}', row #{ctx._meta.Row}"

keywords =
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
      do => (get key).then save(val)
  'check equals': (args, ctx) ->
    for key, val of args
      expect(get key).toEqual val, assertFailedMsg(ctx)
  'check matches': (args, ctx) ->
    for key, val of args
      expect(get key).toMatch val, assertFailedMsg(ctx)
  'set': (args) ->
    for key, val of args
      do => set key, val
  'ignore synchronization': (args) ->
    ignore = if args.ignore in ['true', 'yes', '1'] then true else false
    browser.ignoreSynchronization = ignore
  'sleep': (args) ->
    browser.sleep (args.milliseconds || 0) + 1000 * (args.seconds || 0)
  'switch to': (args) ->
    result = q.defer()
    if args.title
      q.all browser.getAllWindowHandles().then (handles) ->
        _.map handles, (wh) =>
          browser.switchTo().window(wh).then =>
            browser.getTitle().then (t) ->
              title: t
              handle: wh
      .then (titles) =>
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
  'wait to disappear': (args) -> waitFor args, protractor.ExpectedConditions.invisibilityOf
  'run': (args) -> runner.runExcelSheet args.file, args.sheet, _.omit(args, ['file', 'sheet'])
  'clear local storage': -> browser.executeScript 'window.localStorage.clear();'

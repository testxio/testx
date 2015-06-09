object = require('../objects').element
_ = require 'lodash'
runner = require '../lib/runner'
request = require 'request'

DEFAULT_TIMEOUT = -> browser.params.testx.actionTimeout || 5000

get = (key) ->
  object(key).wait DEFAULT_TIMEOUT()
  object(key).get()
set = (key, value) ->
  object(key).wait DEFAULT_TIMEOUT(), protractor.ExpectedConditions.elementToBeClickable
  object(key).set value

waitFor = -> (condition = protractor.ExpectedConditions.visibilityOf) ->
  (args) ->
    for key, obj of _.omit(args, 'timeout')
      (object obj).wait parseInt(args.timeout), condition

exports.add = (kw) -> _.assign(keywords, kw)
exports.get = -> keywords

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
  'check equals': (args) ->
    for key, val of args
      do => expect(get key).toEqual val
  'check matches': (args) ->
    for key, val of args
      do => expect(get key).toMatch val
  'set': (args) ->
    for key, val of args
      do => set key, val
  'ignore synchronization': (args) ->
    ignore = if args.ignore in ['true', 'yes', '1'] then true else false
    browser.ignoreSynchronization = ignore
  'sleep': (args) ->
    browser.sleep (args.milliseconds || 0) + 1000 * (args.seconds || 0)
  'switch to': (args) ->
    if args.title
      q.all browser.getAllWindowHandles().then (handles) ->
        _.map handles, (wh) =>
            browser.switchTo().window(wh)
              result = {}
              result[browser.getTitle()] = wh
              result
      .done (titles) =>
        for title in titles
          do =>
            browser.switchTo().window titles[args.title]
    if args.frame
      browser.switchTo().frame args.frame
  'wait to appear': -> waitFor()
  'wait to disappear': -> waitFor protractor.ExpectedConditions.invisibilityOf
  'run': (args) -> runner.runExcelSheet args.file, args.sheet, _.omit(args, ['file', 'sheet'])
  'clear local storage': -> browser.executeScript 'window.localStorage.clear();'

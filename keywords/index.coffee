object = require('../objects').element
_ = require 'lodash'
runner = require '../lib/runner'
request = require 'request'

get = (key) -> object(key).get()
set = (key, value) -> object(key).set value

waitForPresence = (reducer) ->
  (args) ->
    browser.wait ->
      waits = for key, obj of _.omit(args, 'timeout')
        object(obj).isPresent()
      protractor.promise.all(waits).then reducer
    , parseInt(args.timeout)

allTrue = (items) -> items.reduce (x, y) -> x && y
allFalse = (items) -> !items.reduce (x, y) -> x || y

exports.add = (kw) -> _.assign(keywords, kw)
exports.get = -> keywords

keywords =
  'go to': (args) ->
    browser.get args.url
  'save': (args, ctx) ->
    for key, val of args
      do => (get key).then (value) -> ctx[val] = value
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
  'wait to appear': waitForPresence allTrue
  'wait to disappear': waitForPresence allFalse
  'run': (args) -> runner.runExcelSheet args.file, args.sheet, _.omit(args, ['file', 'sheet'])
  'clear local storage': -> browser.executeScript 'window.localStorage.clear();'

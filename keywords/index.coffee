objects = require('../objects')()
els = require './elements'
_ = require 'lodash'
runner = require '../lib/runner'

_by = (key) ->
  [loc, val] = [objects[key].locator, objects[key].value]
  protractor.By[loc] val

find = (key) -> element _by(key)

get = (key) -> els(find key).then (el) -> el.get()
set = (key, value) -> els(find key).then (el) -> el.set value

waitForPresence = (reducer) ->
  (args) ->
    browser.wait ->
      waits = for key, obj of _.omit(args, 'timeout')
        find(obj).isPresent()
      protractor.promise.all(waits).then reducer
    , args.timeout

allTrue = (items) -> items.reduce (x, y) -> x && y
allFalse = (items) -> !items.reduce (x, y) -> x || y

module.exports =
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
  'wait for redirect': (args) ->
    browser.sleep args.milliseconds
  'wait to appear': waitForPresence allTrue
  'wait to disappear': waitForPresence allFalse
  'run': (args) -> runner.runExcelSheet args.file, args.sheet, _.omit(args, ['file', 'sheet'])
  'clear local storage': -> browser.executeScript 'window.localStorage.clear();'
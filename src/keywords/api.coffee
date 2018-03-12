_ = require 'lodash'
{timeout} = require '../utils'

cond  = protractor.ExpectedConditions
DEFAULT_TIMEOUT = -> testx.params.actionTimeout || 5000

get = (key) ->
  testx.element(key).wait(DEFAULT_TIMEOUT()).then (el) ->
    await el.get()
getAttribute = (key, attribute) ->
  testx.element(key).wait( DEFAULT_TIMEOUT()).then (el) ->
    await el.getAttribute(attribute)
getAll = (key) ->
  await testx.elements key
set = (key, value) ->
  await wait {objects: [key]}, cond.elementToBeClickable
  el = await testx.element(key)
  await el.set value
wait = (args, condition = cond.visibilityOf) ->
  for obj in args.objects
    tmt = timeout args.timeout, DEFAULT_TIMEOUT()
    el = await testx.element obj
    await el.wait tmt, condition

module.exports =
  get: get
  getAll: getAll
  getAttribute: getAttribute
  set: set
  wait: wait
  convertSimpleArgs: (args, defaultArg) ->
    if Array.isArray args or typeof args isnt 'object'
      arg = args
      args = {}
      args[defaultArg] = arg
    args

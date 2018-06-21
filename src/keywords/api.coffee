_ = require 'lodash'
{timeout} = require '../utils'

cond  = protractor.ExpectedConditions
DEFAULT_TIMEOUT = -> testx.params.actionTimeout || 5000

get = (key) ->
  el = await testx.element(key).wait(DEFAULT_TIMEOUT())
  await el.get()
getAttribute = (key, attribute) ->
  el = await testx.element(key).wait( DEFAULT_TIMEOUT())
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
  convertSimpleArgs: (args, defaultArg, toArray = false) ->
    if typeof args isnt 'object' or Array.isArray args
      arg = args
      args = {}
      args[defaultArg] = if toArray then [arg] else arg
    args

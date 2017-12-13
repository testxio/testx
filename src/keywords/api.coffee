{timeout} = require '../libs/utils'

cond  = protractor.ExpectedConditions
DEFAULT_TIMEOUT = -> testx.params.actionTimeout || 5000

get = (key) ->
  testx.element(key).wait(DEFAULT_TIMEOUT()).then -> testx.element(key).get()
getAll = (key) ->
  testx.elements(key).wait(DEFAULT_TIMEOUT()).then -> testx.element(key).get()
set = (key, value) ->
  wait {objects: [key]}, cond.elementToBeClickable
  testx.element(key).set value
wait = (args, condition = cond.visibilityOf) ->
  for obj in args.objects
    tmt = timeout args.timeout, DEFAULT_TIMEOUT()
    (testx.element obj).wait tmt, condition

module.exports =
  get: get
  getAll: getAll
  set: set
  wait: wait
  convertSimpleArgs: (args, defaultArg) ->
    if Array.isArray args or typeof args isnt 'object'
      arg = args
      args = {}
      args[defaultArg] = arg
    args

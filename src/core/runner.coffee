_ = require 'lodash'
since = require 'jasmine2-custom-message'
resolver = require '@testx/context-resolver'

{assertFailedMsg} = require '../utils'
assert = require '../assert'

exec = (keywords, step, context) ->
  origExpect = global.expect
  try
    msg = assertFailedMsg context, step
    global.expect = since(-> "#{msg}\n#{@message}").expect
    if step.arguments.hasOwnProperty 'expect result'
      expecteds = step.arguments['expect result']
      step.arguments = _.omit step.arguments, ['expect result']
      context.$result = await keywords[step.name](step.arguments, context)
      assert expecteds, context.$result
    else
      context.$result = await keywords[step.name](step.arguments, context)
  finally
    global.expect = origExpect

module.exports = (keywords, staticCtx) ->
  runScript: (script, ctx) ->
    base =
      _meta: script.source
    context = _.merge {}, staticCtx, base, ctx, testx.params.context
    testx.events.emit 'script/start', script, context
    for step in script.steps
      try
        context._meta = _.merge context._meta, step.meta
        ctx = resolver context
        step.arguments = ctx step.arguments
        testx.events.emit 'step/start', step, context
        await exec keywords, step, context
        testx.events.emit 'step/done', step, context
      catch e
        throw new Error """#{assertFailedMsg context, step}
        #{e}"""
    await testx.events.emit 'script/done', script, context

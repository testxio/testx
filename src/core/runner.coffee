_ = require 'lodash'
since = require 'jasmine2-custom-message'
resolver = require '@testx/context-resolver'

{assertFailedMsg} = require '../utils'

module.exports = (keywords, functions) ->
  assert = (expecteds, actual) ->
    for cond, expected of expecteds
      switch cond
        when 'to equal' then expect(actual).toEqual expected
        when 'to match' then expect(actual).toMatch expected
        when 'not to equal' then expect(actual).not.toEqual expected
        when 'not to match' then expect(actual).not.toMatch expected

  runScript: (script, ctx) ->
    context = _.merge {}, ctx, functions,
      _meta: script.source
      params: browser.params
    testx.events.emit 'script/start', script, context
    for step in script.steps
      context._meta = _.merge context._meta, step.meta
      ctx = resolver context
      step.arguments = ctx step.arguments
      testx.events.emit 'step/start', step, ctx
      origExpect = global.expect
      global.expect = since(-> assertFailedMsg context, step, @message).expect
      if step.arguments.hasOwnProperty 'expect result'
        expecteds = step.arguments['expect result']
        step.arguments = _.omit step.arguments, ['expect result']
        context.$result = await keywords[step.name] step.arguments, context
        assert expecteds, context.$result
      else
        context.$result = await keywords[step.name] step.arguments, context
      global.expect = origExpect
      testx.events.emit 'step/done', step, ctx
    testx.events.emit 'script/done', script, context

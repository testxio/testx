_ = require 'lodash'
resolver = require '@testx/context-resolver'

{defer} = require './utils'

module.exports = (keywords, functions) ->
  run = (step, context) ->
    mergedContext = _.merge context,
      params: browser.params
    ->
      mergedContext._meta = _.merge mergedContext._meta, step.meta
      ctx = resolver mergedContext
      step.arguments = ctx step.arguments
      testx.events.emit 'step/start', step, mergedContext
      result = keywords[step.name] step.arguments, mergedContext
      if result and Array.isArray result
        Promise.all(result).then (data) ->
          context.$result = data
      else
        Promise.resolve(result).then (data) ->
          context.$result = data
      testx.events.emit 'step/done', step, mergedContext


  runScript: (script, ctx) ->
    context = _.merge {}, ctx, functions,
      _meta: script.source
    flow = protractor.promise.controlFlow()
    flow.execute -> testx.events.emit 'script/start', script, context
    for step in script.steps
      flow.execute run(step, context)
    flow.execute -> testx.events.emit 'script/done', script, context

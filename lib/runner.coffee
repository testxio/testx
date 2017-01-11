_ = require 'lodash'

{resolver, defer} = require './utils'

module.exports = (keywords, functions) ->
  run = (step, context) ->
    mergedContext = _.merge context,
      params: browser.params

    ->
      ctx = resolver mergedContext
      testx.events.emit 'step/start', step, ctx
      mergedContext._meta = _.merge mergedContext._meta, step.meta
      protractor.promise.controlFlow().execute ->
        keywords[step.name] (ctx step.arguments), mergedContext
        testx.events.emit 'step/done', step, ctx

  runScript: (script, ctx) ->
    context = _.merge {}, ctx, functions,
      _meta: script.source
    testx.events.emit 'script/start', script, context
    flow = protractor.promise.controlFlow()
    flow.execute(run(step, context)) for step in script.steps
    flow.execute -> testx.events.emit 'script/done', script, context

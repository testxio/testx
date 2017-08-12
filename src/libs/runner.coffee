_ = require 'lodash'

{resolver, defer} = require './utils'

module.exports = (keywords, functions) ->
  run = (step, context) ->
    mergedContext = _.merge context,
      params: browser.params

    ->
      protractor.promise.controlFlow().execute ->
        mergedContext._meta = _.merge mergedContext._meta, step.meta
        ctx = resolver mergedContext
        step.arguments = ctx step.arguments
        testx.events.emit 'step/start', step, mergedContext
        keywords[step.name] step.arguments, mergedContext
        testx.events.emit 'step/done', step, mergedContext

  runScript: (script, ctx) ->
    context = _.merge {}, ctx, functions,
      _meta: script.source
    testx.events.emit 'script/start', script, context
    flow = protractor.promise.controlFlow()
    flow.execute(run(step, context)) for step in script.steps
    flow.execute -> testx.events.emit 'script/done', script, context

_ = require 'lodash'

{resolver, defer} = require './utils'

module.exports = (keywords, functions) ->
  run = (step, context) ->
    ctx = resolver _.merge context,
      params: browser.params
    ->
      testx.events.emit 'step/start', step, ctx

      context._meta = _.merge context._meta, step.meta
      protractor.promise.controlFlow().execute ->
        keywords[step.name] (ctx step.arguments), context
        testx.events.emit 'step/done', step, ctx

  runScript: (script, ctx) ->
    context = _.merge {}, ctx, functions,
      _meta: script.source
    testx.events.emit 'script/start', script, context
    flow = protractor.promise.controlFlow()
    flow.execute(run(step, context)) for step in script.steps
    flow.execute -> testx.events.emit 'script/done', script, context

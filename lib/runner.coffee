_ = require 'lodash'

{resolver} = require './utils'

module.exports = (keywords, functions) ->
  run = (step, context) ->
    ctx = resolver _.merge context,
      params: browser.params
    ->
      testx.events.emit 'step:start', step, ctx

      context._meta = _.merge context._meta, step.meta
      protractor.promise.controlFlow().execute ->
        keywords[step.name] (ctx step.arguments), context

  runScript: (script, ctx) ->
    testx.events.emit 'test:start', script, ctx

    context = _.merge {}, ctx, functions,
      _meta: script.source
    flow = protractor.promise.controlFlow()
    flow.execute(run(step, context)) for step in script.steps

_ = require 'lodash'
colors = require 'colors'

{resolver, printable} = require './utils'

module.exports = (keywords, functions) ->
  run = (step, context) ->
    ctx = resolver _.merge context,
      params: browser.params
    ->
      args = ctx step.arguments
      fullName = step.meta['Full name'].cyan
      row = colors.yellow "row #{step.meta.Row}"
      console.log "Executing step #{fullName} on #{row} with arguments:"
      for k, v of args
        console.log(colors.grey "  #{k}: #{v}")
      context._meta = _.merge context._meta, step.meta
      protractor.promise.controlFlow().execute ->
        keywords[step.name] args, context

  logScriptStart = (script) ->
    source = if script.source
      "script in #{colors.bold(printable script.source)}"
    else
      colors.bold 'inline script'
    console.log colors.cyan """

    ====================================================================================================
    Executing #{source}
    ====================================================================================================

    """
    if browser.params.testx.logScript
      console.log 'SCRIPT:', JSON.stringify(script, null, 2)

  runScript: runScript = (script, ctx) ->
    logScriptStart script

    context = _.merge {}, ctx, functions,
      _meta: script.source
    flow = protractor.promise.controlFlow()
    flow.execute(run(step, context)) for step in script.steps

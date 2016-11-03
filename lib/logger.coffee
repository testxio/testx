colors = require 'colors'
{printable} = require './utils'

module.exports = (eventEmitter) ->
  eventEmitter.on 'test:start', logScriptStart
  eventEmitter.on 'step:start', logStepStart
  eventEmitter.on 'spec:done', -> console.log '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'


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

logStepStart = (step, context) ->
  args = context step.arguments
  fullName = step.meta['Full name'].cyan
  row = colors.yellow "row #{step.meta.Row}"
  console.log "Executing step #{fullName} on #{row} with arguments:"
  for k, v of args
    console.log(colors.grey "  #{k}: #{v}")

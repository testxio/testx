colors = require 'colors'
{printable} = require './utils'

module.exports = (eventEmitter) ->
  eventEmitter.on 'script/start', logScriptStart
  eventEmitter.on 'step/start', logStepStart


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

  if testx.params.logScript
    console.log 'SCRIPT:', JSON.stringify(script, null, 2)

logStepStart = (step, context) ->
  fullName = step.meta['Full name'].cyan
  row = colors.yellow "row #{step.meta.Row}"
  console.log "Executing step #{fullName} on #{row} with arguments:"
  for k, v of step.arguments
    console.log(colors.grey "  #{k}: #{JSON.stringify v, null, 4}")

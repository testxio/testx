_ = require 'lodash'
keywords = require('../keywords').get()
functions = require('../functions').get()
xls2script = require './xls2script'

exports.runScript = runScript = (script, ctx) =>
  context = _.assign(ctx || {}, functions)
  flow = protractor.promise.controlFlow()
  flow.execute(run(step, context)) for step in script.steps

exports.runExcelSheet = (file, sheet, context) =>
  flow = protractor.promise.controlFlow()
  console.log "Executing script on sheet #{sheet.cyan} in file #{file.cyan}"
  flow.execute(-> xls2script.convert(file, sheet)).then (script) =>
    console.log JSON.stringify(script, undefined, 2) if params.testx.logScript
    runScript script, context

run = (step, context) ->
  ->
    args = {}
    for k, v of step.arguments
      do =>
        args[k] = v.replace /(\{\{.+?\}\})/g, (match) ->
          result = context[match[2...-2]]
          if typeof result == 'function'
            result()
          else
            result
    fullName = step.meta['Full name'].cyan
    row = "row #{step.meta.Row}".yellow
    arg = JSON.stringify(args, undefined, 2).grey
    console.log "Executing step #{fullName} on #{row} with arguments:\n#{arg}\n"
    protractor.promise.controlFlow().execute ->
      keywords[step.name] args, context

fs = require 'fs'
_ = require 'lodash'
colors = require 'colors'

keywords = require('../keywords').get()
functions = require('../functions').get()
xls2script = require './xls2script'

exports.runScript = runScript = (script, ctx) =>
  context = _.assign(ctx || {}, functions)
  flow = protractor.promise.controlFlow()
  flow.execute(run(step, context)) for step in script.steps

exports.runExcelSheet = (file, sheet, context) =>
  stat = fs.statSync file
  if stat.isFile()
    flow = protractor.promise.controlFlow()
    flow.execute(-> xls2script.convert(file, sheet)).then (script) =>
      console.log colors.cyan("====================================================================================================")
      console.log colors.bold "Executing script on sheet #{colors.cyan(sheet)} in file #{colors.cyan(file)}"
      console.log colors.cyan("====================================================================================================\n")
      console.log JSON.stringify(script, undefined, 2) if browser.params.testx.logScript
      runScript script, context

run = (step, context) ->
  ctx = resolve context
  ->
    args = {}
    for k, v of step.arguments
      do =>
        args[ctx k] = ctx v
    fullName = step.meta['Full name'].cyan
    row = colors.yellow "row #{step.meta.Row}"
    console.log "Executing step #{fullName} on #{row} with arguments:"
    for k, v of args
      console.log(colors.grey "  #{k}: #{v}")
    protractor.promise.controlFlow().execute ->
      keywords[step.name] args, context

resolve = (context) ->
  (variable) ->
    variable.replace /(\{\{.+?\}\})/g, (match) ->
      result = context[match[2...-2]]
      if typeof result == 'function'
        result()
      else
        result

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
  console.log file, sheet
  flow.execute(-> xls2script.convert(file, sheet)).then (script) =>
    console.log script
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
    console.log """Executing step \x1b[36m#{step.meta['Full name']}\x1b[m on \x1b[33mrow #{step.meta.Row}\x1b[m with arguments:
                  \x1b[38;5;245m#{JSON.stringify(args, undefined, 2)}\x1b[m

                """
    keywords[step.name] args, context

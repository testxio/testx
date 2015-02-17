_ = require 'lodash'
keywords = require '../keywords'
functions = require('../functions')()
xls2script = require './xls2script'

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
#    console.log args
#    console.log "Executing step #{step.meta['Full name']} on row #{step.meta.Row} with arguments:"
    keywords[step.name] args, context

exports.runExcelSheet = (file, sheet, ctx) =>
  context = _.assign(ctx || {}, functions)
  flow = protractor.promise.controlFlow()
  flow.execute(-> xls2script.convert(file, sheet)).then (script) ->
    flow.execute(run(step, context)) for step in script.steps

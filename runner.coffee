keywords = require './keywords'
xls2script = require './xls2script'

exports.run = run = (script) ->
  for step in script.steps
    do => keywords[step.name] step.arguments

exports.runExcelSheet = (file, sheet) -> xls2script.convert(file, sheet).then run
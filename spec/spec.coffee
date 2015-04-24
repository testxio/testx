runner = require '../lib/runner'

describe 'sample test', ->
  it 'CSK-722;validatie bsn nummer in houder overzicht', ->
    runner.runExcelSheet 'xls/sample.xls', 'Test'

runner = require '../lib/runner'

describe 'art', ->
  it 'CSK-722;validatie bsn nummer in houder overzicht', ->
    runner.runExcelSheet 'xls/sample.xls', 'Test'

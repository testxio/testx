runner = require '../../'

describe 'Google search 1', ->
  it 'should display relevant results 11', ->
    runner.runExcelSheet 'tests/xls/sample.xlsx', 'Test',
      fromSpec: 'New York'

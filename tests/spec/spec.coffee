runner = require '../../'

describe 'Google search', ->
  it 'should display relevant results', ->
    runner.runExcelSheet 'tests/xls/sample.xlsx', 'Test',
      fromSpec: 'New York'

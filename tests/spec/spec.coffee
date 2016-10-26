describe 'TestX', ->
  it 'should be able to run an Excel sheet using the deprecated runExcelSheet', ->
    testx.runExcelSheet 'tests/scripts/sample.xlsx', 'Test',
      fromSpec: 'New York'
  it 'should be able to run an Excel sheet using the run method', ->
    testx.run 'tests/scripts/sample.xlsx', 'Test',
      fromSpec: 'New York'
  it 'should be able to run a testx file with context', ->
    testx.run 'tests/scripts/sample.testx',
      match: 'New York'
  it 'should be able to run a testx file without context', ->
    testx.run 'tests/scripts/no-context.testx'
  it 'should be able to run an inline yaml script', ->
    testx.runScript testx.parsers.get('testx').parse '''
    - run:
        file: 'tests/scripts/sample.xlsx'
        sheet: 'Test'
        fromSpec: 'New York'
    '''

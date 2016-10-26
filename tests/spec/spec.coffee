describe 'Google search', ->
  it 'should display relevant results (runExcelSheet)', ->
    testx.runExcelSheet 'tests/scripts/sample.xlsx', 'Test',
      fromSpec: 'New York'
  it 'should display relevant results (run xlsx)', ->
    testx.run 'tests/scripts/sample.xlsx', 'Test',
      fromSpec: 'New York'
  it 'should display relevant results (run testx)', ->
    testx.run 'tests/scripts/sample.testx',
      match: 'New York'
  it 'should display relevant results (runScript testx)', ->
    testx.runScript testx.parsers.get('testx').parse '''
    - run:
        file: 'tests/scripts/sample.xlsx'
        sheet: 'Test'
        fromSpec: 'New York'
    '''

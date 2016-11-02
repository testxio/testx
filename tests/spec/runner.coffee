describe 'Runner', ->
  it 'should be able to run an Excel without initial context', ->
    testx.run 'tests/scripts/sample.xlsx', 'static'
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
  it 'should be able to run an in-line yaml script', ->
    testx.runScript testx.parsers.get('testx').parse '''
    - run:
        file: 'tests/scripts/sample.xlsx'
        sheet: 'Test'
        fromSpec: 'New York'
    '''
  it 'should be able to run in-line CoffeeScript based tests', testx.with ->
    @goTo
      url: '/'
    @set
      searchBox: 'new york city'
      searchBtn: ''
    @checkMatches
        resultLink: 'New York'

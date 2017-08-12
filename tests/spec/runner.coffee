describe 'Runner', ->
  it 'should be able to run a testx file with context', ->
    testx.run 'tests/scripts/sample.testx',
      match: 'New York'
  it 'should be able to run a testx file without context', ->
    testx.run 'tests/scripts/no-context.testx'
  it 'should be able to run an in-line yaml script', ->
    testx.runScript testx.parsers.get('testx').parse '''
    - run:
        file: 'tests/scripts/sample.testx'
        match: 'New York'
    '''
  it 'should be able to run in-line CoffeeScript tests', testx.with ->
    match = 'New York'
    @goTo
      url: '/'
    @set
      searchBox: 'new york city'
      searchBtn: ''
    @checkMatches
      resultLink: match
    @run
      file: 'tests/scripts/sample.testx'
      match: match

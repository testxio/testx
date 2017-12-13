describe 'Keyword', ->
  it 'wait should work', ->
    testx.run 'tests/scripts/wait.testx',
      match: 'testxio'

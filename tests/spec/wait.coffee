describe 'Keyword', ->
  describe 'wait should work', ->
    it 'should test more', ->
      testx.run 'tests/scripts/wait.testx',
        match: 'testxio'

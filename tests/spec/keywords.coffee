describe 'Keyword', ->
  it 'delete cookies should delete all cookies', ->
    testx.run 'tests/scripts/cookies.testx'
  it 'check matches works with attributes', ->
    testx.run 'tests/scripts/checkMatches.testx'

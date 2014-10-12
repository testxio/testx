keywords = require './keywords'
script = require './script'
describe 'json script', ->
  it 'should succeed', ->
    for step in script.steps
      do =>
        console.log 'executing step', step.name, 'with arguments', step.arguments
        keywords[step.name] step.arguments

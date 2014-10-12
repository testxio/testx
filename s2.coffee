keywords = require './keywords'
script = require './script'
describe 'angularjs homepage 2', ->
  it 'should have a title 2', ->
    for step in script.steps
      do => keywords[step.name] step.arguments

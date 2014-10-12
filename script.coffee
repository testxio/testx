module.exports =
  steps: [
    {
    name: 'goto'
    arguments:
      url: 'http://juliemr.github.io/protractor-demo/'
    }
    {
    name: 'check title is'
    arguments:
      title: 'Super Calculator'
    }
    {
    name: 'set'
    arguments:
      'first': '1'
      'second': '2'
      'go-button': null
    }
    {
    name: 'check equals'
    arguments:
      'first': ''
      'second': ''
      'result': '3'
    }
  ]

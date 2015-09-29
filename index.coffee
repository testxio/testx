require 'coffee-errors'
_ = require 'lodash'
objects = require('./objects')

module.exports =
  runExcelSheet: require('./lib/runner').runExcelSheet
  runScript: require('./lib/runner').runScript
  objects: objects
  element: objects.element
  keywords: require('./keywords')
  functions: require('./functions')
  with: (f) ->
    flow = protractor.promise.controlFlow()
    keywords = require('./keywords').get()
    context = {}
    wrap = (f) -> (params...) ->
      flow.execute ->
        params.push context
        console.log 'params', params
        f.apply @, params
    kwrds =
      goTo: wrap keywords['go to']
      set: wrap keywords['set']
      waitToAppear: wrap keywords['wait to appear']
      checkMatches: wrap keywords['check matches']
      save: wrap keywords.save
      
    f.bind(kwrds)

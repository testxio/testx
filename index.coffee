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
    wrap = (f, passContext = true) -> (params...) ->
      flow.execute ->
        params.push context if passContext
        console.log 'params', params
        f.apply @, params
    kwrds =
      get: (params...) ->
        wrap(keywords.get, false)
        .apply(@, params)
        .then (values) ->(v.value_ for v in values)
      goTo: wrap keywords['go to']
      set: wrap keywords['set']
      waitToAppear: wrap keywords['wait to appear']
      checkMatches: wrap keywords['check matches']
      save: wrap keywords.save
      log: wrap(console.log, false)
      do: (f) -> (wrap f)()

    f.bind(kwrds)

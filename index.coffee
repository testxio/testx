require 'coffee-errors'
_ = require 'lodash'
objects = require('./objects')
camelCase = require('camel-case')

objify = (name, f) ->
  obj = {}
  obj[name] = f
  obj

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
    wrap = (f, passContext = true) -> (params...) ->
      flow.execute ->
        params.push context if passContext
        f.apply @, params
    context = {}
    kwrds = _.extend _.extend.apply(@, (objify(camelCase(k), wrap(v)) for k, v of keywords)),
      get: (params...) ->
        wrap(keywords.get, false)
        .apply(@, params)
        .then (values) ->(v.value_ for v in values)
      log: wrap(console.log, false)
      do: (f) -> (wrap f)()

    f.bind(kwrds)

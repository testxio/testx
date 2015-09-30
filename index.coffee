require 'coffee-errors'
_ = require 'lodash'
camelCase = require('camel-case')

objects = require('./objects')
objectify = require('./lib/utils').objectify

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
    wrap = (f, passContext = true) -> (params...) =>
      flow.execute =>
        params.push context if passContext
        f.apply @, params
    context = {}
    kwrds = _.extend _.extend.apply(@, (objectify(camelCase(k), wrap(v)) for k, v of keywords)),
      get: (params...) ->
        wrap(keywords.get, false)
        .apply(@, params)
        .then (values) ->(v.value_ for v in values)
      log: wrap(console.log, false)
      do: (f) -> (wrap.call kwrds, f)()

    f.bind(kwrds)

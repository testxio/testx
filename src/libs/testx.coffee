path = require 'path'
fs = require 'fs'
deprecate = require('util').deprecate
_ = require 'lodash'
camelCase = require 'camel-case'
colors = require 'colors'

xlsx = require 'testx-xlsx-parser'

{resolver, objectify, defer} = require './utils'

module.exports = class TestX
  constructor: ->
    @params = require './params'
    @parsers = (require './parsers').add 'testx-yaml-parser'
    @keywords = require '../keywords'
    @objects = require '../objects'
    @element = @objects.element
    @elements = @objects.elements
    @functions = require '../functions'
    @runner = require('./runner') @keywords.get(), @functions.get()
    @runScript = @runner.runScript
    @events = require './events'
    require('./logger') @events
    defer => @events.emit 'testx/loaded', @params

  runExcelSheet: deprecate (file, sheet, context) ->
    @run file, sheet, context
  , colors.red """ #{colors.bold('testx.runExcelSheet')} is deprecated and will be removed in the next major release. Please, use #{colors.bold('testx.run')} instead."""

  run: (args...) ->
    context = if args.length > 1 and typeof args[-1..][0] is 'object' then args.pop()
    @runScript (@parseFile.apply @, args), context

  parseFile: (file, sheet) ->
    stat = fs.statSync file
    if stat.isFile()
      extension = path.extname file
      extension = extension[1..] if extension[0] is '.'
      if parser = @parsers.get(extension)
        script = if parser.parseFile
          parser.parseFile file
        else
          parser.parse fs.readFileSync(file, 'utf8')
      else # assume this is an MS Excel file for backwards compatibility
        xlsx.parse file, sheet, testx.params.locale
    else
      console.error "'#{file}' is not a file."

  with: (f) ->
    flow = protractor.promise.controlFlow()
    keywords = @keywords.get()
    wrap = (f, passContext = true) -> (params...) =>
      flow.execute =>
        params[0] = resolver(context) params[0]
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

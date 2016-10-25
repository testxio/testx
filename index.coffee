require 'coffee-errors'

path = require 'path'
fs = require 'fs'

_ = require 'lodash'
camelCase = require 'camel-case'

xlsx = require 'testx-xlsx-parser'

{resolver, objectify} = require './lib/utils'

class TestX
  constructor: ->
    @parsers = (require './lib/parsers').add 'testx-yaml-parser'
    @keywords = require './keywords'
    @objects = require './objects'
    @element = @objects.element
    @elements = @objects.elements
    @functions = require './functions'
    @runner = require('./lib/runner') @keywords.get(), @functions.get()
    @runScript = @runner.runScript

  runExcelSheet: (file, sheet, context) ->
    source =
      file: file
      sheet: sheet
    context = _.merge {}, context,
      _meta:
        file: file
        sheet: sheet
    @run source, context

  run: (source, context) ->
    @runScript (@parseFile source), context

  parseFile: (source) ->
    file = if typeof source is 'string' then source else source.file
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
        xlsx.parse file, source.sheet, browser.params.testx.locale
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

global.testx = new TestX

module.exports = testx

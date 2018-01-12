path = require 'path'
fs = require 'fs'
deprecate = require('util').deprecate
_ = require 'lodash'
camelCase = require 'camel-case'

logger = require '@testx/logger-default'
resolver = require '@testx/context-resolver'

{objectify, defer} = require './utils'

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
    logger @events
    defer => @events.emit 'testx/loaded', @params

  run: (args...) ->
    context = if args.length > 1 and typeof args[-1..][0] is 'object' then args.pop()
    @runScript (@parseFile.apply @, args), context

  parseFile: (file) ->
    stat = fs.statSync file
    if stat.isFile()
      extension = path.extname file
      extension = extension[1..] if extension[0] is '.'
      if parser = @parsers.get(extension)
        script = if parser.parseFile
          parser.parseFile file
        else
          parser.parse fs.readFileSync(file, 'utf8')
      else
        console.error """Error while trying to parse #{file}.
                         Unknown file extension '#{extension}'.
                         Did you install a parser for it?
                         """
    else
      console.error "'#{file}' is not a file."

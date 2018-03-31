logger = require '@testx/logger-default'
resolver = require '@testx/context-resolver'

{defer} = require '../utils'
parsers = require '../parsers'
runner = require './runner'

module.exports = class TestX
  constructor: ->
    @params = require './params'
    @parsers = parsers.add '@testx/parser-yaml'
    @keywords = require '../keywords'
    @objects = require '../objects'
    @element = @objects.element
    @elements = @objects.elements
    @functions = require '../functions'
    @runner = runner @keywords.get(), @functions.get()
    @runScript = @runner.runScript
    @events = require '../events'
    logger @events
    defer => @events.emit 'testx/loaded', @params

  run: (file, ctx) -> @runScript parsers.parseFile(file), ctx

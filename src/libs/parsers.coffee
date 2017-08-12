{acquire} = require './utils'

parsers = {}

module.exports =
  add: (prsr, exts) ->
    parser = acquire prsr
    extensions = if typeof exts is 'string' then [exts] else exts or []
    parsers[ext] = parser for ext in extensions.concat(parser.extensions)
    @

  get: (ext) ->
    if ext
      parsers[ext]
    else
      parsers

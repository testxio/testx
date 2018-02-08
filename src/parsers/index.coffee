fs = require 'fs'
path = require 'path'

{acquire} = require '../utils'

parsers = {}

module.exports =
  add: (prsr, exts) ->
    parser = acquire prsr
    extensions = if typeof exts is 'string' then [exts] else exts or []
    parsers[ext] = parser for ext in extensions.concat(parser.extensions)
    @

  get: get = (ext) ->
    if ext
      parsers[ext]
    else
      parsers

  parseFile: (file) ->
    stat = fs.statSync file
    if stat.isFile()
      extension = path.extname file
      extension = extension[1..] if extension[0] is '.'
      if parser = get extension
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

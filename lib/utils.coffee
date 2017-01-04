dotize = require 'dotize'

module.exports =
  defer: (fn) -> setTimeout fn, 0
  printable: (obj, delimiter = ', ') ->
    ("#{k}: '#{v}'" for k, v of obj).join delimiter

  acquire: (pkg) ->
    if typeof pkg is 'string'
      require pkg
    else
      pkg

  defunc: (obj) ->
    if typeof obj == 'function' then obj() else obj

  resolver: (context) ->
    (variable) ->
      ctx = dotize.convert context
      resolveOne = (v) ->
        if v
          switch typeof v
            when 'string'
              v.replace /(\{\{.+?\}\})/g, (match) ->
                result = ctx[match[2...-2]]
                if typeof result == 'function'
                  result()
                else
                  result
            when 'object'
              if Array.isArray v
                resolveOne val for val in v
              else
                result = {}
                result[resolveOne key] = resolveOne val for key, val of v
                result
            else v
        else ''

      resolveOne variable

  objectify: (name, f) ->
    obj = {}
    obj[name] = f
    obj

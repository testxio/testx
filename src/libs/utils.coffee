evalWithContext = require '@testx/eval'
Duration = require "duration-js"

module.exports =
  timeout: (tmt, defaultTmt, defaultUnit = 'ms') ->
    timeout = if tmt
      r = /(\d+)(\D+)?/
      if match = tmt.match r
        [m, duration, unit] = match
        unit = if unit then unit.trim() else defaultUnit
        "#{duration}#{unit}"
      else throw new Error "Wrong timeout format '#{tmt}'"
    else "#{defaultTmt}#{defaultUnit}"
    new Duration(timeout).milliseconds()

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

  resolver: (ctx) ->
    (variable) ->
      resolveOne = (v) ->
        if v
          switch typeof v
            when 'string'
              if m = v.match(/(\{\{(.+?)\}\})/) or v.match(/(\$\{(.+?)\})/)
                [full, withCurlies, varname] = m
                result = evalWithContext ctx, varname
                result = if typeof result is 'function'
                  result ctx
                else
                  resolveOne result
                if withCurlies is v
                  resolveOne result
                else
                  resolveOne v.replace withCurlies, result
              else v
            when 'object'
              if Array.isArray v
                resolveOne val for val in v
              else
                result = {}
                for key, val of v
                  result[resolveOne key] = resolveOne val
                result
            else v
        else v

      resolveOne variable


  objectify: (name, f) ->
    obj = {}
    obj[name] = f
    obj

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

  resolver: (ctx) ->
    (variable) ->
      resolveOne = (v) ->
        if v
          switch typeof v
            when 'string'
              if m = v.match /(\{\{(.+?)\}\})/
                [full, withCurlies, varname] = m
                result = ctx[varname]
                switch typeof result
                  when 'string'
                    result
                  when 'function'
                    resolveOne result()
                  else
                    resolveOne result
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
        else ''

      resolveOne variable

  objectify: (name, f) ->
    obj = {}
    obj[name] = f
    obj

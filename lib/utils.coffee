module.exports =
  defunc: (obj) ->
    if typeof obj == 'function' then obj() else obj

  resolver: (context) ->
    (variable) ->
      resolveOne = (v) ->
        v.toString().replace /(\{\{.+?\}\})/g, (match) ->
          result = context[match[2...-2]]
          if typeof result == 'function'
            result()
          else
            result

      switch typeof variable
        when 'string'
          resolveOne v
        when 'object'
          result = {}
          for key, val of variable
            do =>
              result[resolveOne key] = resolveOne val
          result
        else
          variable

  objectify: (name, f) ->
    obj = {}
    obj[name] = f
    obj

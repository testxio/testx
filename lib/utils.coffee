module.exports =
  defunc: (obj) ->
    if typeof obj == 'function' then obj() else obj

  resolver: (context) ->
    (variable) ->
      variable.replace /(\{\{.+?\}\})/g, (match) ->
        result = context[match[2...-2]]
        if typeof result == 'function'
          result()
        else
          result

  objectify: (name, f) ->
    obj = {}
    obj[name] = f
    obj

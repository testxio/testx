module.exports =
  defunc: (obj) ->
    if typeof obj == 'function' then obj() else obj

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

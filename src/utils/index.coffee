_ = require 'lodash'
Duration = require 'duration-js'

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

  printable: pr = (obj, delimiter = ', ') ->
    ("#{k.toLowerCase()}: '#{v}'" for k, v of obj).join delimiter

  acquire: (pkg) ->
    if typeof pkg is 'string'
      require pkg
    else
      pkg

  defunc: (obj) ->
    if typeof obj == 'function' then obj() else obj

  assertFailedMsg: (ctx, step) ->
    location = pr _.pick ctx._meta, 'file', 'sheet', 'Row'
    msg = "Failed expectation at #{location}"
    msg = "#{msg}, keyword: '#{step.name}'" if step
    msg = "#{msg}."

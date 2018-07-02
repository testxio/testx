{get} = require './api'

module.exports =
  'save': (args, ctx) ->
    for key, val of args
      value = await get val
      ctx[key] = value
  'put': (args, ctx) ->
    for key, val of args
      ctx[key] = val

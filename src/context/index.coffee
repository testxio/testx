_ = require 'lodash'
{defunc} = require '../utils'

context = {}

module.exports =
  add: (ctx) -> _.assign context, defunc(ctx)
  get: -> context

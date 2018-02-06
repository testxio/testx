_ = require 'lodash'
{defunc} = require '../utils'

functions = {}

module.exports =
  add: (funcs) -> _.assign functions, defunc(funcs)
  get: -> functions

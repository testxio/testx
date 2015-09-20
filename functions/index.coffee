_ = require 'lodash'
defunc = require('../lib/utils').defunc

functions = {}

module.exports =
  add: (funcs) -> _.assign functions, defunc(funcs)
  get: -> functions

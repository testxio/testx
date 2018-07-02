_ = require 'lodash'
{defunc} = require '../utils'

keywords = do ->
  core = require './core'
  checks = require './check'
  navigates = require './navigate'
  waits = require './wait'
  expects = require './expect'
  misc = require './misc'
  run = require './run'
  context = require './context'
  _.merge keywords, core, checks, navigates, waits, expects, misc, run, context

module.exports =
  add: (kw) -> _.merge keywords, defunc(kw)
  get: -> keywords

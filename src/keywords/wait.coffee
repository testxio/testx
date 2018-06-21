{wait, convertSimpleArgs} = require './api'
{assertFailedMsg} = require '../utils'

module.exports =
  wait: (args, ctx) ->
    args = convertSimpleArgs args, 'objects', typeof args is 'string'
    args.to ?= 'appear'
    if args.to is 'appear'
      await wait args
    else if args.to is 'disappear'
      await wait args, protractor.ExpectedConditions.invisibilityOf
    else
      msg = assertFailedMsg ctx
      throw new Error "Unknown wait condition '#{args.to}'. #{msg}"
  'wait to appear': (args) -> @wait args
  'wait to disappear': (args) ->
    args = convertSimpleArgs args, 'objects', typeof args is 'string'
    args.to = 'disappear'
    @wait args

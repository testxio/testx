{wait, convertSimpleArgs} = require './api'
{assertFailedMsg} = require '../utils'

module.exports =
  wait: (args, ctx) ->
    args = convertSimpleArgs args, 'objects'
    args.to ?= 'appear'
    if args.to is 'appear'
      await wait args
    else if args.to is 'disappear'
      await wait args, protractor.ExpectedConditions.invisibilityOf
    else
      throw new Error "Uknown wait condition '#{args.to}'. #{assertFailedMsg ctx}"
  'wait to appear': (args) -> @wait args
  'wait to disappear': (args) ->
    args = convertSimpleArgs args, 'objects'
    args.to = 'disappear'
    @wait args

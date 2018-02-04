{wait, convertSimpleArgs} = require './api'

module.exports =
  wait: (args, ctx) ->
    args = convertSimpleArgs args, 'objects'
    args.to ?= 'appear'
    if args.to is 'appear'
      wait args
    else if args.to is 'disappear'
      wait args, protractor.ExpectedConditions.invisibilityOf
    else
      failMsg = assertFailedMsg ctx
      throw new Error "Uknown wait condition '#{args.to}'. #{failMsg}"
  'wait to appear': (args) -> @wait args
  'wait to disappear': (args) ->
    args = convertSimpleArgs args, 'objects'
    args.to = 'disappear'
    @wait args

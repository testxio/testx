{wait, convertSimpleArgs} = require './api'

module.exports =
  wait: (args, ctx) ->
    args = convertSimpleArgs args, 'objects'
    args.to ?= 'appear'
    if args.to is 'appear'
      wait args
    else if args.to is 'disappear'
      # Hack for the 'stale element' exception plague
      acceptableErrors = ['StaleElementReferenceError', 'NoSuchElementError']
      wfs = wait args, protractor.ExpectedConditions.invisibilityOf
      for wf in wfs
        wf.catch (err) -> throw err unless err.name in acceptableErrors
    else
      throw
        new Error "Uknown wait condition '#{args.to}'. #{assertFailedMsg ctx}"
  'wait to appear': (args) -> @wait args
  'wait to disappear': (args) ->
    args = convertSimpleArgs args, 'objects'
    args.to = 'disappear'
    @wait args

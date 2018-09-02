_ = require 'lodash'
{get, set} = require './api'

module.exports =
  'get': (keys) ->
    for key in keys
      await get key
  'set': (args) ->
    for key, val of args
      await set key, val
  'switch to': (args) ->
    if args.title
      Promise.all browser.getAllWindowHandles().then (handles) ->
        _.map handles, (wh) ->
          browser.switchTo().window(wh).then ->
            browser.getTitle().then (t) ->
              title: t
              handle: wh
      .then (titles) ->
        ttls = (t.title for t in titles)
        if args.title not in ttls
          throw new Error("Could not find a window with title '#{args.title}'! Known windows are [#{ttls}].")
        else
          for t in titles
            if t.title == args.title
              browser.switchTo().window t.handle
    else if args.frame
      browser.switchTo().frame args.frame
  'respond to dialog': (args) ->
    dialog = await browser.switchTo().alert()
    switch args.response.toLowerCase() # Key should be 'response'
      when "ok" then dialog.accept()
      when "cancel" then dialog.dismiss()

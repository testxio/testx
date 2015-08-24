_ = require 'lodash'
parse = require 'csv-parse'
fs = require 'fs'

objects = {}

module.exports =
  add: (objs) ->
    if typeof objs == "object"
      _.assign(objects, objs)
    else # if the argument is not an object we assume it is a CSV file path
      fs.createReadStream(objs).pipe parse {delimiter: ','}, (err, data) ->
        throw new Error(err) if err
        objects[row[0]] = locator: row[1], value: row[2] for row in data

  get: -> objects

  element: (key) ->
    el = element _by(key)
    el.set = (val) ->
      if val == "[CLEAR]"
        @clear()
      else if val
        @sendKeys protractor.Key.chord(protractor.Key.CONTROL, "a") + val
      else
        @click()
    el.get = ->
      @getTagName().then (tag) =>
        switch tag
          when 'input', 'textbox'
            @getAttribute 'value'
          when 'img'
            @getAttribute 'src'
          when 'select'
            @$('option:checked').getText()
          else
            @getText()
    el.wait = (timeout, expCondition = protractor.ExpectedConditions.visibilityOf) ->
      browser.wait expCondition.call(protractor.ExpectedConditions, @), timeout
    el

_by = (key) ->
  [first, rest...] = (e.trim() for e in key.split /\(|\)|\,/ when e)
  obj = objects[first]
  if obj
    if typeof obj == 'function'
      if rest.length == obj.length
        obj = obj.apply(@, rest)
      else
        throw new Error "Object '#{first}' is a function with #{obj.length} arguments. You are trying to execute it with #{rest.length} arguments."
    protractor.By[obj.locator] obj.value
  else
    throw new Error "Could not find a locator for object '#{first}'! Is this object defined?"

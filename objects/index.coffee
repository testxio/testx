_ = require 'lodash'
parse = require 'csv-parse'
fs = require 'fs'
defunc = require('../lib/utils').defunc

objects = {}

module.exports =
  add: (objs) ->
    objs = defunc objs
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
          when 'input'
            @getAttribute('type').then (tp) ->
              switch tp
                when 'radio', 'checkbox'
                  @isSelected()
                else
                  @getAttribute 'value'
          when 'textbox'
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
  match = /^(.+)\((.*)\)$/.exec key.trim()
  if match
    [full, func, args] = match
    obj = objects[func]
    if typeof obj == 'function'
      parsed = eval "[#{args}]"
      if parsed.length == obj.length
        obj = obj.apply(@, parsed)
        protractor.By[obj.locator] obj.value
      else
        throw new Error "Object '#{func}' is a function with #{obj.length} argument(s). You are trying to execute it with #{parsed.length} argument(s)."
    else
      throw new Error "Object '#{func}' is not a function."
  else if object = objects[key]
    protractor.By[object.locator] object.value
  else
    throw new Error "Could not find a locator for object '#{key}'! Is this object defined?"

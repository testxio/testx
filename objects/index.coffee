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
  element: (key) -> _element() key
  elements: (key) ->
    el = _element(element.all) key
    el.wait = (timeout, expCondition = protractor.ExpectedConditions.visibilityOf) ->
      # waiting seems not to be supported when using `element.all`, wait on a single element
      browser.wait expCondition.call(protractor.ExpectedConditions, element _by(key)), timeout
    el

defaultBehaviours =
  set: (val) ->
    if val == "[CLEAR]"
      @clear()
    else if val
      Key = protractor.Key
      @sendKeys Key.HOME, Key.chord(Key.SHIFT, Key.END), val
    else
      @click()
  get: ->
    @getTagName().then (tag) =>
      switch tag
        when 'input'
          @getAttribute('type').then (tp) =>
            switch tp
              when 'radio', 'checkbox'
                @isSelected().then (result) -> result.toString()
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
  wait: (timeout, expCondition = protractor.ExpectedConditions.visibilityOf) ->
    browser.wait expCondition.call(protractor.ExpectedConditions, @), timeout

_element = (findFunc = element) -> (key) ->
  findElement = ->
    augmentedBehaviours = _.extend(defaultBehaviours, object.behaviour or object.behavior)
    _.extend findFunc(protractor.By[object.locator] object.value), augmentedBehaviours

  match = /^([^\(]+)\((.*)\)$/.exec key.trim()
  if match
    [full, func, args] = match
    obj = objects[func]
    if typeof obj == 'function'
      parsed = eval "[#{args}]"
      if parsed.length == obj.length
        obj = obj.apply(@, parsed)
        findElement()
      else
        throw new Error "Object '#{func}' is a function with #{obj.length} argument(s). You are trying to execute it with #{parsed.length} argument(s)."
    else
      throw new Error "Object '#{func}' is not a function."
  else if object = objects[key]
    findElement()
  else
    throw new Error "Could not find a locator for object '#{key}'! Is this object defined?"

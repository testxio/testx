_ = require 'lodash'

objects = {}

exports.add = (objs) -> _.assign(objects, objs)
exports.get = -> objects
exports.element = (key) ->
  el = element _by(key)
  el.set = (val) ->
    if val
      @clear()
      @sendKeys val
    else
      @click()
  el.get = ->
    @getTagName().then (tag) =>
      switch tag
        when 'input', 'textbox'
          @getAttribute 'value'
        when 'img'
          @getAttribute 'src'
        else
          @getText()
  el

_by = (key) ->
  [loc, val] = [objects[key].locator, objects[key].value]
  protractor.By[loc] val

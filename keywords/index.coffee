objects = require '../objects'

find = (key) ->
  [loc, val] = [objects[key].locator, objects[key].value]
  element(protractor.By[loc] val)

get = (key) -> els(find key).then (el) -> el.get()
set = (key, value) -> els(find key).then (el) -> el.set value

module.exports =
  'go to': (args) -> browser.get args.url
  'check title is': (args) -> expect(browser.getTitle()).toEqual args.title
  'check equals': (args) ->
    for key, val of args
      do =>
        expect(get key).toEqual val
  'set': (args) ->
    for key, val of args
      do => set key, val

els = (el) ->
  el.getTagName().then (tag) ->
    switch tag
      when 'input', 'textbox'
        set: (val) ->
          el.clear()
          el.sendKeys val
        get: -> el.getText()
      when 'button'
        set: -> el.click()
        get: -> el.getAttribute 'value'
      else
        set: -> if val then el.sendKeys(val) else el.click()
        get: -> el.getText()

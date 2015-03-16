module.exports = (el) ->
  el.getTagName().then (tag) ->
    switch tag
      when 'input', 'textbox'
        el.getAttribute('type').then (t) ->
          get: -> el.getAttribute 'value'
          set: if t == 'submit' then el.click else defaultSet(el)
      when 'img'
        get: -> el.getAttribute('src')
        set: defaultSet
      else
        defaultElement el

defaultElement = (el) ->
  set: defaultSet el
  get: el.getText

defaultSet = (el) -> (val) ->
  if val
    el.clear()
    el.sendKeys val
  else
    el.click()

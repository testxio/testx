module.exports = ->
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

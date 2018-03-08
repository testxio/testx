module.exports = ->
  set: (val) ->
    if val is undefined or val is null
      @click()
    else
      Key = protractor.Key
      @sendKeys Key.HOME, Key.chord(Key.SHIFT, Key.END), val
  get: ->
    @getTagName().then (tag) =>
      switch tag
        when 'input'
          switch await @getAttribute('type')
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
  wait: (timeout, expCondition = protractor.ExpectedConditions.visibilityOf) ->
    cond = expCondition.call protractor.ExpectedConditions, @
    await browser.wait cond, timeout
    @

module.exports = ->
  set: (val) ->
    type = =>
      Key = protractor.Key
      @sendKeys Key.HOME, Key.chord(Key.SHIFT, Key.END), val
    if val is undefined or val is null
      @click()
    else
      switch await @getTagName()
        when 'input'
          switch await @getAttribute('type')
            when 'radio', 'checkbox'
              selected = await @isSelected()
              @click() if selected isnt val
            else type()
        else type()
  get: ->
    switch await @getTagName()
      when 'input'
        switch await @getAttribute('type')
          when 'radio', 'checkbox'
            @isSelected()
          else
            @getAttribute 'value'
      when 'textarea'
        @getAttribute 'value'
      when 'img'
        @getAttribute 'src'
      when 'select'
        el = await @$('option:checked')
        el.getText()
      else
        @getText()
  wait: (timeout, expCondition = protractor.ExpectedConditions.visibilityOf) ->
    cond = expCondition.call protractor.ExpectedConditions, @
    await browser.wait cond, timeout
    @

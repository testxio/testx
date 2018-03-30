module.exports = ->
  set: (val) ->
    type = =>
      Key = protractor.Key
      @sendKeys Key.HOME, Key.chord(Key.SHIFT, Key.END), val
    if val == "[CLEAR]"
      @clear()
    else if val is undefined or val is null
      @click()
    else
      @getTagName().then (tag) =>
        switch tag
          when 'input'
            @getAttribute('type').then (tp) =>
              switch tp
                when 'radio', 'checkbox'
                  @isSelected().then (result) =>
                    @click() if result isnt val
                else type()
          else type()
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
        when 'textarea'
          @getAttribute 'value'
        when 'img'
          @getAttribute 'src'
        when 'select'
          @$('option:checked').getText()
        else
          @getText()
  wait: (timeout, expCondition = protractor.ExpectedConditions.visibilityOf) ->
    browser.wait expCondition.call(protractor.ExpectedConditions, @), timeout

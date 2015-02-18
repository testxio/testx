_ = require 'lodash'

module.exports = ->
  _.assign(objects, require('./another'))

objects =
#digid mock pagina
  "searchBox":
    locator: "css"
    value: "input[name='q']"
  "searchBtn":
    locator: "css"
    value: "button[name='btnG']"
  "resultLink":
    locator: "css"
    value: "li.g a"

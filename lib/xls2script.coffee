util = require 'util'
FormData = require 'form-data'
fs = require 'fs'
q = require 'q'

exports.convert = (xlsFile, sheet) ->
  deferred = q.defer() # maybe we should not depend on protractor being exposed in the global namespace
  form = new FormData()
  form.append 'file', fs.createReadStream(xlsFile)
  form.submit "#{browser.params.xls2testUrl}/#{sheet}", (err, res) ->
    if err then deferred.reject err
    result = ''
    res.on 'data', (data) -> result += data.toString()
    res.on 'end', -> deferred.resolve(JSON.parse result)
    res.resume()
  deferred.promise

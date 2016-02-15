FormData = require 'form-data'
fs = require 'fs'
q = require 'q'
xlsx = require 'testx-xlsx-parser'

exports.convert = (xlsFile, sheet) ->
  if browser.params.testx.xls2testUrl
    deferred = q.defer()
    form = new FormData()
    form.append 'file', fs.createReadStream(xlsFile)
    form.submit "#{browser.params.testx.xls2testUrl}/#{sheet}", (err, res) ->
      if err then deferred.reject err
      unless res then deferred.reject """
        Could not convert excel sheet #{sheet} in file #{xlsFile}.
        Make sure the conversion service is available at #{browser.params.testx.xls2testUrl}."""
      result = ''
      res.on 'data', (data) -> result += data.toString()
      res.on 'end', -> deferred.resolve(JSON.parse result)
      res.resume()
    deferred.promise
  else
    xlsx.parse xlsFile, sheet, browser.params.testx.locale

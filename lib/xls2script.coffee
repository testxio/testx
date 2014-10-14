request = require 'request'
util = require 'util'
FormData = require 'form-data'
fs = require 'fs'

exports.convert = (xlsFile, sheet) ->
  deferred = protractor.promise.defer() # maybe we should not depend on protractor being exposed in the global namespace
  form = new FormData()
  form.append 'file', fs.createReadStream(xlsFile)
  form.submit "http://localhost:4567/#{sheet}", (err, res) ->
    if err then deferred.reject err
    res.on 'data', (data) ->
      deferred.fulfill(JSON.parse data.toString())
    res.resume()
  deferred.promise
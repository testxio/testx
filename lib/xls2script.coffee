request = require 'request'
util = require 'util'
FormData = require 'form-data'
fs = require 'fs'
q = require 'q'

exports.convert = (xlsFile, sheet) ->
  deferred = q.defer() # maybe we should not depend on protractor being exposed in the global namespace
  form = new FormData()
  form.append 'file', fs.createReadStream(xlsFile)
  form.submit "http://localhost:4567/#{sheet}", (err, res) ->
    if err then deferred.reject err
    res.on 'data', (data) ->
      deferred.resolve(JSON.parse data.toString())
    res.resume()
  deferred.promise
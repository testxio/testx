testr = require './testr'
request = require 'request'
util = require 'util'
FormData = require 'form-data'
fs = require 'fs'

form = new FormData()
form.append 'file', fs.createReadStream('/tmp/temp.xls')
form.submit 'http://localhost:4567/Test', (err, res) ->
  res.on 'data', (data) ->
    script = JSON.parse data.toString()
    testr.run script
#    console.log util.inspect(JSON.parse(data.toString()), depth: null)
  res.resume()

#handler = (error, response, body) ->
#  console.log error, response, body
#fs.createReadStream('/tmp/temp.xls').pipe request.post('http://localhost:4567/Test', console.log)

#request.post 'http://localhost:4567/Test', (error, response, body) ->
#  if (!error && response.statusCode == 200)
#    script = JSON.parse body
#    testr.run script
#  else
#    console.log 'Something went wrong!', error, response

#testr.run require('./script').scriptAsJson
#testr.run require('./script').scriptAsFunc
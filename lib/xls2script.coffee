util = require 'util'
FormData = require 'form-data'
fs = require 'fs'
q = require 'q'
xlsx = require 'xlsx'

exports.convert = (xlsFile, sheet) ->
  deferred = q.defer()
  if browser.params.testx.xls2testUrl
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
  else
    wb = xlsx.readFile xlsFile
    rows = getRows wb.Sheets[sheet]
    steps = for row, i in rows
      getKeyword(rows, i)
    deferred.resolve
      steps: (s for s in steps when s)
  deferred.promise

getRows = (sheet) ->
  r = /(\w+)(\d+)/i
  rows = []
  for key, value of sheet
    if key[0] != '!'
      [match, col, row] = r.exec key
      row = parseInt row
      col = col.toUpperCase()
      unless rows[row] then rows[row] = []
      rows[row][col] = value
  rows

getKeyword = (rows, i) ->
  row = rows[i]
  prevRow = rows[i - 1]
  if row?['A']?.w
    [match, name, ignore, comment] = /([^\[|\]]*)(\[(.*)\])?/.exec row['A'].w
    keyword =
      name: name.trim()
      meta:
        Row: i
        "Full name": row['A'].w
        Comment: comment?.trim() || ''
      arguments: {}
    cols = Object.keys(rows[i - 1]).sort (l, r) -> l > r
    for col in cols
      keyword.arguments[prevRow[col]?.w] = row[col]?.w || ''
    keyword
  else
    null

fs = require 'fs'
path = require 'path'
_ = require 'lodash'

getPackageJson = ->
  cwd = process.cwd()
  # Is the cwd somewhere within an npm package?
  root = process.cwd()
  while !fileExists(path.join root, 'package.json')
    if root == '/' or root.match(/^[A-Z]:\\/)
      root = cwd
      break
    root = path.resolve(root, '..')
  path.join(root, 'package.json')


fileExists = (file) ->
  try
    fs.statSync(filePath).isFile()
  catch e
  false

module.exports = do ->
  _.extend {}, require(getPackageJson())?.testx, browser.params.testx

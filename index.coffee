require 'coffee-errors'
objects = require('./objects')

module.exports =
  runExcelSheet: require('./lib/runner').runExcelSheet
  runScript: require('./lib/runner').runScript
  objects: objects
  element: objects.element
  keywords: require('./keywords')
  functions: require('./functions')

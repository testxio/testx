require 'coffee-errors'
objects = require('./objects')

module.exports =
  runExcelSheet: require('./lib/runner').runExcelSheet
  objects: objects
  element: objects.element
  keywords: require('./keywords')
  functions: require('./functions')

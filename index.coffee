require 'coffee-errors'

TestX = require './lib/testx'

global.testx ?= new TestX

module.exports = testx

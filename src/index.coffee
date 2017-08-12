require 'coffee-errors'

TestX = require './libs/testx'

global.testx ?= new TestX

module.exports = testx

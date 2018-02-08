assert = require '../assert'

module.exports =
  expect: expect = (args, ctx) ->
    for actual, expecteds of args
      assert expecteds, actual
  'expect result': (args, ctx) ->
    assert args, ctx.$result

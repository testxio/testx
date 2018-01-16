{get, getAll, assertFailedMsg} = require './api'

map = (args, cb) -> Object.entries(args).map ([key, val]) -> cb key, val

check = (condition, positive = true) -> (args, ctx) ->
  map args, (key, val) ->
    cond = expect get key
    cond = cond.not if not positive
    cond[condition] val, assertFailedMsg ctx

checkResult = (args, ctx) ->
  checkOne = (method, exp) -> (actual) ->
    expect(exp)[method] actual, assertFailedMsg ctx
  if eq = args.equals then ctx.$result.map checkOne('toEqual', eq)
  if mt = args.matches then ctx.$result.map checkOne('toMatch', eq)

module.exports =
  'check result': checkResult
  'check equals': check 'toEqual'
  'check not equals': check 'toEqual', false
  'check matches': check 'toMatch'
  'check not matches': check 'toMatch', false
  'check exists': (args, ctx) ->
    map args, (key, val) ->
      getAll(key).then (values) ->
        if val or val is ''
          expect(values?.length).toBeTruthy assertFailedMsg ctx
        else
          expect(values?.length).toBeFalsy assertFailedMsg ctx
  'check enabled': (args, ctx) ->
    map args, (key, val) ->
      expect(testx.element(key).isEnabled()).toBe val, assertFailedMsg ctx
  'check readonly': (args, ctx) ->
    map args, (key, val) ->
      expected = if val then val else null
      actual = testx.element(key).getAttribute('readonly')
      expect(actual).toBe expected, assertFailedMsg ctx

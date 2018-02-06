{get, getAll, getAttribute} = require './api'

map = (args, cb) -> Object.entries(args).map ([key, val]) -> cb key, val

check = (condition, positive = true) -> (args, ctx) ->
  map args, (key, val) ->
    cond = expect get key
    cond = cond.not if not positive
    cond[condition] val

module.exports =
  'check equals': check 'toEqual'
  'check not equals': check 'toEqual', false
  'check matches': check 'toMatch'
  'check not matches': check 'toMatch', false
  'check attribute': (args, ctx) ->
    {object, attribute} = args
    getAttribute(object, attribute).then (attr) ->
      expect(args['to equal']).toEqual attr
  'check exists': (args, ctx) ->
    map args, (key, val) ->
      getAll(key).then (values) ->
        if val or val is ''
          expect(values?.length).toBeTruthy()
        else
          expect(values?.length).toBeFalsy()
  'check enabled': (args, ctx) ->
    map args, (key, val) ->
      expect(testx.element(key).isEnabled()).toBe val
  'check readonly': (args, ctx) ->
    map args, (key, val) ->
      expected = if val then val else null
      actual = testx.element(key).getAttribute('readonly')
      expect(actual).toBe expected

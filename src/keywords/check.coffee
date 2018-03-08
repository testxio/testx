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
    attr = await getAttribute object, attribute
    expect(args['to equal']).toEqual attr
  'check exists': (args, ctx) ->
    map args, (key, val) ->
      values = await getAll key
      if val or val is ''
        expect(values?.length).toBeTruthy()
      else
        expect(values?.length).toBeFalsy()
  'check enabled': (args, ctx) ->
    map args, (key, val) ->
      el = await testx.element key
      expect(el.isEnabled()).toBe val
  'check readonly': (args, ctx) ->
    map args, (key, val) ->
      expected = if val then val else null
      el = await testx.element key
      actual = await el.getAttribute('readonly')
      expect(actual).toBe expected

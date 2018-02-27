module.exports = (expecteds, actual) ->
  for cond, expected of expecteds
    switch cond
      when 'to equal' then expect(actual).toEqual expected
      when 'to match' then expect(actual).toMatch expected
      when 'not to equal' then expect(actual).not.toEqual expected
      when 'not to match' then expect(actual).not.toMatch expected

module.exports = (expecteds, actual) ->
  for cond, expected of expecteds
    switch cond
      when 'to equal' then await expect(actual).toEqual expected
      when 'to match' then await expect(actual).toMatch expected
      when 'not to equal' then await expect(actual).not.toEqual expected
      when 'not to match' then await expect(actual).not.toMatch expected

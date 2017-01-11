module.exports =
  compare: (args, ctx) ->
    expect(args.expected).toEqual args.actual

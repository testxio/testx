module.exports =
  compare: (args, ctx) ->
    expect(args.expected).toEqual args.actual
  log: (args, ctx) ->
    for arg in args
      console.log "#{arg}:", ctx[arg]

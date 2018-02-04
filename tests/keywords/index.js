module.exports = {
  compare: (args, ctx) => expect(args.expected).toEqual(args.actual),
  log: (args, ctx) => {
    var arg, i, len, results;
    results = [];
    for (i = 0, len = args.length; i < len; i++) {
      arg = args[i];
      results.push(console.log(`${arg}:`, ctx[arg]));
    }
    return results;
  },
  id: args => args
};

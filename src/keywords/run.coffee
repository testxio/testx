_ = require 'lodash'

module.exports =
  run: (args, ctx) ->
    context = _.extend {}, ctx, _.omit(args, ['file'])
    await testx.run args.file, context

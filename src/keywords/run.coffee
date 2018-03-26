_ = require 'lodash'
{convertSimpleArgs} = require './api'

module.exports =
  run: (args, ctx) ->
    args = convertSimpleArgs args, 'file'
    context = _.extend {}, ctx, _.omit(args, ['file'])
    await testx.run args.file, context

_ = require 'lodash'
{convertSimpleArgs} = require './api'

module.exports =
  run: (args, ctx) ->
    args = convertSimpleArgs args, 'script'
    context = _.extend {}, args.context, ctx
    await testx.run args.script, context

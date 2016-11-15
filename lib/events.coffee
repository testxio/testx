EventEmitter = require 'events'


createJasmineReporter = (emitter) ->
  emit = (eventType) -> (data) -> emitter.emit eventType, data

  jasmineStarted: emit 'specs/loaded'
  suiteStarted: emit 'suite/start'
  specStarted: emit 'spec/start'
  specDone: emit 'spec/done'
  suiteDone: emit 'suite/done'

module.exports = do ->
  emitter = new EventEmitter
  jasmine?.getEnv().addReporter createJasmineReporter emitter
  emitter

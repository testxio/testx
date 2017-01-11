exports.config =
  directConnect: true
  specs: ['spec/*']

  capabilities:
    browserName: 'chrome'
    shardTestFiles: false
    maxInstances: 5


  framework: 'jasmine'
  jasmineNodeOpts:
    silent: true
    defaultTimeoutInterval: 300000
    includeStackTrace: false

  baseUrl: 'http://google.com'

  onPrepare: ->
    require '../'
    testx.objects.add 'tests/objects.csv'
    testx.keywords.add require './keywords'
    beforeEach ->
      browser.ignoreSynchronization = true

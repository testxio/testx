exports.config =
  directConnect: true
  specs: ['spec/*']

  capabilities:
    browserName: 'chrome'
    shardTestFiles: false
    maxInstances: 5
    chromeOptions:
      args: ["--no-sandbox", "--headless", "--disable-gpu", "--window-size=1024,800"]

  framework: 'jasmine'
  jasmineNodeOpts:
    silent: true
    defaultTimeoutInterval: 300000
    includeStackTrace: false

  baseUrl: 'http://google.com'

  onPrepare: ->
    require '../'
    testx.objects.add 'tests/objects.csv'
    testx.objects.add require './objects'
    testx.functions.add require './functions'
    testx.keywords.add require './keywords'
    beforeEach ->
      browser.ignoreSynchronization = true

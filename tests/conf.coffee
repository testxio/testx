require '../'

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

  params:
    testx:
      logScript: false
      actionTimeout: 4000

  onPrepare: ->
    testx.objects.add 'tests/objects.csv'
    testx.objects.add
      resultLink:
        locator: 'cssContainingText'
        value: ['h3.r a', 'New York']
    beforeEach -> browser.ignoreSynchronization = true

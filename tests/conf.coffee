testx = require '../'

exports.config =
  directConnect: true
  specs: ['spec/spec*']

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
  rootElement: 'html' # change to the root element of the angular.js app

  params:
    testx:
      logScript: false
      actionTimeout: 4000

  onPrepare: ->
    testx.objects.add 'tests/objects.csv'
    beforeEach -> browser.ignoreSynchronization = true

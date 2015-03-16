request = require 'request'
util = require 'util'
FormData = require 'form-data'
fs = require 'fs'



exports.config =
  seleniumAddress: 'http://localhost:4444/wd/hub' #can be overriden via the command line option with --seleniumAddress=http://localhost:4444/wd/hub
  specs: ['spec/*']

  capabilities:
    browserName: 'chrome'
    shardTestFiles: false
    maxInstances: 2
    # chromeOptions:
    #   args: ['user-agent=Mozilla/5.0 (iPhone 8.0)']

  jasmineNodeOpts:
    silent: true
    defaultTimeoutInterval: 300000

  rootElement: 'html' # change to the root element of the angular.js app

  params:
    xls2testUrl: 'http://docker1.rni.org:4567'

  onPrepare: ->
    # comment next line for angular.js apps
    beforeEach -> browser.ignoreSynchronization = true

    # uncomment next line to clear local storage before each test
    # beforeEach -> browser.executeScript 'window.localStorage.clear();'

    require 'jasmine-reporters'
    jasmine.getEnv().addReporter(new jasmine.JUnitXmlReporter 'testresults/junit', true, true, 'junit', true)

    HtmlReporter = require 'protractor-html-screenshot-reporter'
    jasmine.getEnv().addReporter(new HtmlReporter baseDirectory: 'testresults/html')

    require 'jasmine-spec-reporter'
    jasmine.getEnv().addReporter new jasmine.SpecReporter(displayStacktrace: true)

  onComplete: ->
    if browser.params.reportResults
      console.log 'Sending results to the test results repository...'
      form = new FormData()
      form.append 'junit', fs.createReadStream('testresults/junit/junit.xml')
      form.append 'application_name', browser.params.appName || 'CSK' #set via --params.appName command line parameter
      form.append 'application_version', browser.params.appVersion || '0' #set via --params.appVersion command line parameter
      form.append 'testrun_description', browser.params.testDesc || 'CS ART' #set via --params.appVersion command line parameter
      form.append 'testrun_user', browser.params.testUser || 'unknown; set via --params.testUser command line parameter'
      form.append 'testrun_version', browser.params.testVersion || '0' #set via --params.testVersion command line parameter
      form.append 'test_target', browser.params.testTarget || 'unknown; set via --params.testTarget command line parameter'
      form.append 'test_platform', browser.params.testPlatform || 'firefox' #set via --params.testPlatform command line parameter
      form.submit 'http://testwiki.lrk.org:4567/upload', (err, res) ->
        if err then throw err
        console.log 'Results sent!'
    else
      console.log 'Test results are not saved to TRR. Execute with --params.reportResults=true to report test results.'

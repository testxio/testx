request = require 'request'
FormData = require 'form-data'
fs = require 'fs'

unpack = (func) -> (obj) ->
  if typeof obj == 'function'
    func obj()
  else
    func obj

module.exports =
  runExcelSheet: require('./lib/runner').runExcelSheet
  addObjects: unpack require('./objects').add
  addKeywords: unpack require('./keywords').add
  addFunctions: unpack require('./functions').add
  element: require('./objects').element

  onPrepare: ->
    require 'coffee-errors'

    require 'jasmine-reporters'
    jasmine.getEnv().addReporter(new jasmine.JUnitXmlReporter 'testresults/junit', true, true, 'junit', true)

    HtmlReporter = require 'protractor-html-screenshot-reporter'
    jasmine.getEnv().addReporter(new HtmlReporter baseDirectory: 'testresults/html')

    require 'jasmine-spec-reporter'
    jasmine.getEnv().addReporter new jasmine.SpecReporter(displayStacktrace: true)

  onComplete: ->
    if browser.params.reportResults
      console.warn "--params.reportResults is deprecated, please use --params.testx.reportResults instead."
    if browser.params.reportResults || browser.params.testx.reportResults
      console.log 'Sending results to the test results repository...'
      form = new FormData()
      form.append 'junit', fs.createReadStream('testresults/junit/junit.xml')
      form.append 'application_name', browser.params.testx.appName || 'unknown' # set via --params.testx.appName command line parameter'
      form.append 'application_version', browser.params.testx.appVersion || '0' #set via --params.testx.appVersion command line parameter
      form.append 'testrun_description', browser.params.testx.testDesc || 'ART' #set via --params.testx.appVersion command line parameter
      form.append 'testrun_user', browser.params.testx.testUser || 'unknown' #set via --params.testx.testUser command line parameter'
      form.append 'testrun_version', browser.params.testx.testVersion || '0' #set via --params.testx.testVersion command line parameter
      form.append 'test_target', browser.params.testx.testTarget || 'unknown' #set via --params.testx.testTarget command line parameter'
      form.append 'test_platform', browser.params.testx.testPlatform || 'chrome' #set via --params.testx.testPlatform command line parameter
      form.submit browser.params.testx.reportServiceUrl, (err, res) ->
        if err then throw err
        console.log 'Results sent!'
    else
      console.warn 'Test results are not saved to TRR. Execute with --params.testx.reportResults=true to report test results.'

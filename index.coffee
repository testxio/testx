request = require 'request'
util = require 'util'
FormData = require 'form-data'
fs = require 'fs'

module.exports =
  runExcelSheet: require('./lib/runner').runExcelSheet
  addObjects: require('./objects').add
  addKeywords: require('./keywords').add
  addFunctions: require('./functions').add

  onPrepare: ->
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
      form.append 'application_name', browser.params.appName || 'unknkown; set via --params.appName command line parameter'
      form.append 'application_version', browser.params.appVersion || '0' #set via --params.appVersion command line parameter
      form.append 'testrun_description', browser.params.testDesc || 'ART' #set via --params.appVersion command line parameter
      form.append 'testrun_user', browser.params.testUser || 'unknown; set via --params.testUser command line parameter'
      form.append 'testrun_version', browser.params.testVersion || '0' #set via --params.testVersion command line parameter
      form.append 'test_target', browser.params.testTarget || 'unknown; set via --params.testTarget command line parameter'
      form.append 'test_platform', browser.params.testPlatform || 'chrome' #set via --params.testPlatform command line parameter
      form.submit browser.params.testx.reportServiceUrl, (err, res) ->
        if err then throw err
        console.log 'Results sent!'
    else
      console.log 'Test results are not saved to TRR. Execute with --params.reportResults=true to report test results.'

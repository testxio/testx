exports.config =
#  seleniumAddress: 'http://localhost:4444/wd/hub' #can be specified on the command line with --seleniumAddress=http://localhost:4444/wd/hub
  specs: ['spec/*']

  capabilities:
    browserName: 'chrome'
    shardTestFiles: true
    maxInstances: 2

  jasmineNodeOpts:
    silent: true

  onPrepare: ->
    require 'jasmine-reporters'
    jasmine.getEnv().addReporter(new jasmine.JUnitXmlReporter null, true, true, '.')

    HtmlReporter = require 'protractor-html-screenshot-reporter'
    jasmine.getEnv().addReporter(new HtmlReporter baseDirectory: '/tmp/screenshots')

    require 'jasmine-spec-reporter'
    jasmine.getEnv().addReporter new jasmine.SpecReporter(displayStacktrace: true)

exports.config =
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['spec.coffee']

  capabilities:
    browserName: 'chrome'
    shardTestFiles: true
    maxInstances: 2

  onPrepare: ->
    require 'jasmine-reporters'
    jasmine.getEnv().addReporter(new jasmine.JUnitXmlReporter null, true, true, '.')

    HtmlReporter = require 'protractor-html-screenshot-reporter'
    jasmine.getEnv().addReporter(new HtmlReporter baseDirectory: '/tmp/screenshots')

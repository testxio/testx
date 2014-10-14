runner = require '../lib/runner'

describe 'CS tests', ->
  it 'should run from excel script', ->
    runner.runExcelSheet 'xls/sample.xls', 'Test'
  it 'should run normally', ->
    browser.get 'protractor-demo/'
    expect(browser.getTitle()).toEqual 'Super Calculator'
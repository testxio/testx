runner = require '../lib/runner'

describe 'art', ->
  it 'CSK-722;validatie bsn nummer in houder overzicht', ->
    runner.runExcelSheet 'xls/prkp/UC043_CSK194_zoekPersoon.xls', 'TS194006'

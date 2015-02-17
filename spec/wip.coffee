runner = require '../lib/runner'

describe 'work in progress', ->
  it 'CSK-722;validatie bsn nummer in houder overzicht', ->
    runner.runExcelSheet 'xls/prkp/UC043_CSK194_zoekPersoon.xls', 'TS194006'
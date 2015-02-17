cd ..\..\testdata
call ResetTestData.bat app131.cs.isd.local
cd ..
call protractor conf.coffee --baseUrl=http://prkp-integration.cs.isd.local --seleniumAddress=http://localhost:4444/wd/hub
cd starttest\integration
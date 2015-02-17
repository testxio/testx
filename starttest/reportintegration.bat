cd ..\testdata
call ResetTestData.bat app131.cs.isd.local
cd ..
call protractor conf.coffee --baseUrl=http://prkp-integration.cs.isd.local --seleniumAddress=http://localhost:4444/wd/hub --params.reportResults=true
call protractor confadmin.coffee --baseUrl=http://prkp-integration.cs.isd.local:81 --seleniumAddress=http://localhost:4444/wd/hub --params.reportResults=true
cd starttest

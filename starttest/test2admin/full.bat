cd ..\..\testdata
call ResetTestData.bat app133.cs.isd.local
cd ..
call protractor confadmin.coffee --baseUrl=http://prkp-test2.cs.isd.local:81 --seleniumAddress=http://localhost:4444/wd/hub
cd starttest\test2admin
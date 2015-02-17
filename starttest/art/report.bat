cd ..\..\testdata
call ResetTestData.bat art248.cs.isd.local
cd ..
call protractor conf.coffee --baseUrl=http://localhost.local --seleniumAddress=http://localhost:4444/wd/hub --params.reportResults=true

call protractor confadmin.coffee --baseUrl=http://localhost.local:81 --seleniumAddress=http://localhost:4444/wd/hub --params.reportResults=true
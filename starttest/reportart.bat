cd E:\Sources\Prkp.AutomatedTests
E:
cd testdata
call ResetTestData.bat art248.cs.isd.local
cd ..
call protractor conf.coffee --baseUrl=http://localhost --seleniumAddress=http://localhost:4444/wd/hub --params.reportResults=true
call protractor confadmin.coffee --baseUrl=http://localhost:81 --seleniumAddress=http://localhost:4444/wd/hub --params.reportResults=true

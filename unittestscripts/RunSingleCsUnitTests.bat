if not exist "..\unittestresults" mkdir "..\unittestresults"
if exist "..\unittestresults\%1.trx" del "..\unittestresults\%1.trx"
"c:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\MSTest.exe" /testcontainer:..\..\..\bin\%1.dll /resultsfile:..\unittestresults\%1.trx
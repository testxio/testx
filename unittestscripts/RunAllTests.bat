Echo Starting tests
if not exist "..\testresults" mkdir "..\testresults"
call RunAllCsUnitTests
call RunAllJsUnitTests.bat
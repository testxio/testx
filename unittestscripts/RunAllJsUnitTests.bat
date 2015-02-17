cd ..\..\Prkp.Frontend.ClientApps\Public\AppTests

rem ========================================================================================================
rem Public tests
rem ========================================================================================================

call npm config set loglevel error
call npm install
call git config --global url."https://".insteadOf git://
call bower install --config.interactive=false

call karma start karma-houder.conf.js
type "TestResults\coverage-houder\lcov.info"|repl "SF:." "SF:Prkp.Frontend.ClientApps/Public/Apps" > "..\..\..\Prkp.AutomatedTests\testresults\js-public-testresults.info"

call karma start karma-persoon-home.conf.js
type "TestResults\coverage-persoon-home\lcov.info"|repl "SF:." "SF:Prkp.Frontend.ClientApps/Public/Apps" >> "..\..\..\Prkp.AutomatedTests\testresults\js-public-testresults.info"

call karma start karma-persoon.conf.js
type "TestResults\coverage-persoon\lcov.info"|repl "SF:." "SF:Prkp.Frontend.ClientApps/Public/Apps" >> "..\..\..\Prkp.AutomatedTests\testresults\js-public-testresults.info"

move /Y .\node_modules \temp
rd \temp\node_modules /q /s
move /Y .\bower_components \temp
rd \temp\bower_components /q /s

rem ========================================================================================================
rem Beheer tests
rem ========================================================================================================

cd ..\..\..\Prkp.Frontend.ClientApps\Beheer\AppTests
call npm config set loglevel error
call npm install
call git config --global url."https://".insteadOf git://
call bower install --config.interactive=false

call karma start karma-fbeheerder.conf.js
type "TestResults\coverage-fbeheerder\lcov.info"|repl "SF:." "SF:Prkp.Frontend.ClientApps/Beheer/Apps" > "..\..\..\Prkp.AutomatedTests\testresults\js-beheer-testresults.info"

move /Y .\node_modules \temp
rd \temp\node_modules /q /s
move /Y .\bower_components \temp
rd \temp\bower_components /q /s

rem ========================================================================================================
rem Shared tests
rem ========================================================================================================

cd ..\..\..\Prkp.Frontend.ClientApps\Shared\AppTests
call npm config set loglevel error
call npm install
call git config --global url."https://".insteadOf git://
call bower install --config.interactive=false

call karma start karma-auth-services.conf.js
type "TestResults\coverage-auth-services\lcov.info"|repl "SF:." "SF:Prkp.Frontend.ClientApps/Shared/Apps" > "..\..\..\Prkp.AutomatedTests\testresults\js-shared-testresults.info"

call karma start karma-prkp-common.conf.js
type "TestResults\coverage-prkp-common\lcov.info"|repl "SF:." "SF:Prkp.Frontend.ClientApps/Shared/Apps" >> "..\..\..\Prkp.AutomatedTests\testresults\js-shared-testresults.info"

call karma start karma-prkp-mainapp.conf.js
type "TestResults\coverage-prkp-mainapp\lcov.info"|repl "SF:." "SF:Prkp.Frontend.ClientApps/Shared/Apps" >> "..\..\..\Prkp.AutomatedTests\testresults\js-shared-testresults.info"

call karma start karma-user-info.conf.js
type "TestResults\coverage-user-info\lcov.info"|repl "SF:." "SF:Prkp.Frontend.ClientApps/Shared/Apps" >> "..\..\..\Prkp.AutomatedTests\testresults\js-shared-testresults.info"

move /Y .\node_modules \temp
rd \temp\node_modules /q /s
move /Y .\bower_components \temp
rd \temp\bower_components /q /s




cd ..\..\..\Prkp.AutomatedTests\unittestscripts


testr
=====

Protractor based keyword driven test framework.

Getting started:

0. Make sure you have Node.js, npm (it comes with node) and coffee-script installed on your machine.
1. Install protractor. Here's how: http://angular.github.io/protractor/#/
2. Update and start local selenium server using webdriver-manager (comes with protractor).
3. Clone this project.
4. From within the project directory run 'npm install', you may need sudo power for that
5. From within the project directory run 'protractor conf.coffee --baseUrl=http://prkp-integration.cs.isd.local --seleniumAddress=http://localhost:4444/wd/hub'.
6. Start writing your own tests and keywords. Don't foget to change the conf file accordingly.
7. Enjoy responsibly!

Reports:
1. Run x.bat
2. Logon to the testwiki on http://testwiki.lrk.org:8080/birt/
3. For test summary click 'All test runs with drill-through to test methods per run'
4. Use parameters: <Application> CSK, <testTarget> All, <version> All, <startUser> All or 'yourname'.
5. For full overview including coverage click 'Systeemfuncties'
6. Use parameters: <systeemFunctie> CSK-329, <Application> CSK
		Direct link: http://testwiki.lrk.org:8080/birt/run?__report=report/sysTreeCSK.rptdesign&application=CSK&systeemFunctie=CSK-329
7. In JIRA, use 'will not be executed' for obsolete and when manual selected, add comment after each testrun:
   Versie: 1.0
   Geslaagd: 20140514

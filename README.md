testr
=====

Protractor based keyword driven test framework.

Getting started:

0. Make sure you have Node.js, npm (it comes with node) and coffee-script installed on your machine.
1. Install protractor. Here's how: http://angular.github.io/protractor/#/
		To run selenium server locally you'll need java installed as well.
2. Update and start local selenium server using webdriver-manager (comes with protractor).
3. Clone this project.
4. From within the project directory run 'npm install', you may need sudo power for that
5. From within the project directory run 'protractor conf.coffee --baseUrl=http://prkp-integration.cs.isd.local --seleniumAddress=http://localhost:4444/wd/hub'.
6. Start writing your own tests and keywords. Don't foget to change the conf file accordingly.
7. Enjoy responsibly!

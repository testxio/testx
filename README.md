testx
=====

Protractor and MS Excel based keyword driven test framework. It is possible to use it without MS Excel as well, but Excel provides a very powerful computational platform, that makes everything a lot easier. Of course if you don't want to shell out for MS Excel you can use any of the numerous copies like LibreOffice (OpenOffice) Calc, etc.

Getting started:

0. Make sure you have Node.js, npm (it comes with node) and coffee-script installed on your machine. To run selenium server locally you'll need java as well.
1. Install protractor (may need to run as root/administrator):

	```sh
	npm install -g protractor
	```
2. Update and start local selenium server using webdriver-manager (comes with protractor):

	```sh
	webdriver-manager update
	webdriver-manager start
	```
3. Clone this project.
4. Install all required dependencies, you may need sudo power for that:

	```sh
	npm install
	```
5. You are now ready to run (from within the project directory):

	```sh
	protractor conf.coffee --baseUrl=http://google.com
	```
6. Start writing your own tests and keywords. Don't forget to change the conf file accordingly.
7. Enjoy responsibly!

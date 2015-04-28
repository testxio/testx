testx
=====

A library for executing MS Excel based, keyword driven tests with Protractor.

## How does it work

Keywords
--------

**testx** aims to make web application testing easier by using keyword driven testing.

Furthermore it uses MS Excel sheets as a platform for writing tests.
Essentially you write your tests in MS Excel, utilizing the computational power of MS Excel.
This will free you from having to implement all the things like generating random data, referring to values in other test steps. formatting dates, etc.

It is possible to use **testx** without MS Excel as well, but then it looses a lot of its usefulness.
Of course if you don't want to shell out for MS Excel you can use any of the numerous copies like LibreOffice (OpenOffice) Calc, etc.

Objects
-------

TBA


## Prerequisites

**testx** will only work in protractor based projects. Supported protractor versions are 2.0.0 and up.

## Installation

Create a protractor project. For a sample project clone https://github.com/greyarch/testx-example

Add this module to your project:

	npm install testx --save

This is already done in the sample project so there you only need to:

	npm install

## Run

From within the test project directory:

	protractor conf.coffee --baseUrl=http://google.com

## Configuration

To be able to use **testx** you'll need to services external to it.
One of them is essential - the xls(x) file to test convertor,
and the other one, the reporting service is optional and sending data to it is switched off by default.

All **testx** configuration lives in your protractor configuration file under params.testx, for example (in coffeescript)

	...
	params:
		testx:
			xls2testUrl: 'http://my-xls-to-test.service'
			reportServiceUrl: 'http://my-reporting.service'
	...

## Keywords

**testx** comes with a simpple set keywords that can be extended/overriden from the project.
See the *addKeywords* method for details.

Predefind keywords are:

- **go to** - TBA
- **save** - TBA
- **check equals** - TBA
- **check matches** - TBA
- **set** - TBA
- **ignore synchronization** - TBA
- **wait to appear** - TBA
- **wait to disappear** - TBA
- **run** - TBA
- **clear local storage** - TBA

[![npm version](https://badge.fury.io/js/testx.svg)](https://badge.fury.io/js/testx)
[![Build Status](https://travis-ci.org/testxio/testx.svg?branch=master)](https://travis-ci.org/testxio/testx)

testx
=====

A library for executing keyword driven tests with Protractor.

- [What is testx?](#what-is-testx)
- [New and exciting stuff in testx 2.x](#new-and-exciting-stuff-in-testx-2.x)
- [Migrating from testx 1.x to 2.x](#migrating-from-testx-1.x-to-2.x)
- [Migrating from testx 0.x to 1.x](#migrating-from-testx-0.x-to-1.x)
- [How does it work](#how-does-it-work)
- [API](#api)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Run](#run)
- [Configuration](#configuration)
- [Core keywords](#core-keywords)
- [Additional keyword packages](#additional-keyword-packages)

## What is testx?
Testx is a library for executing keyword driven tests with Protractor. It provides a abstract level of your test executions to make it reader-friendly. For example:

in Protractor you do:

```javascript
browser.get('https://www.google.com');
element(by.name('q')).sendKeys('testx.io');
element(by.css("button[name='btnG']")).click();
expect(element(by.linkText('testxio · GitHub')).elementIsVisible).toBeTruthy();
```
in testx you do this instead:
```
- go to:
    url: 'https://www.google.com'
- set:
    name('q'): testx.io
    css("button[name='btnG']"):
- wait to appear:
    el1: resultLink
```
*Explatination*:
By using pre-defined **testx keywords** such as ```go to```, testx parses the provide url to the Protractor and executes ```browser.get()``` function. The `set` keyword will execute ```element(by.)``` function depending on the parameters used. In the example above it first executes ```element(by.name())```, because a string is provided ```testx.io``` it will also run ```sendKeys()``` and parse the provided string to the function. Without providing string it will run ```click.()``` on the element. 

## New and exciting stuff in testx 2.x
- **testx 2.0** introduces the concept of **parsers** as first class citizens in the **testx** ecosystem. This was motivated by the (surprising) success of the [testx-yaml-parser](http://testx.io/yaml-parser). **testx** will now try to guess how to parse a script file based on its extension. This means, that you can now just have ```testx.run 'scripts/some-test.testx'``` and **testx** will automagically know how to parse it and run it.

- **testx** is now a singleton object and is globally available via the *testx* variable. This means that you only need to require **testx** once, usually at the beginning of your config file and then you can use the *testx* variable anywhere.
- The **run** core keyword is now completely agnostic of the file (type) in which it is used and can target all supported file types.
- [testx-yaml-parser](http://testx.io/yaml-parser) is now bundled with **testx**, so you do not need to install and require it anymore. Files with the *testx*, *yaml* and *yml* extensions will be parsed using this parser.

## Migrating from testx 1.x to 2.x

In order to make **parsers** easy to integrate with the rest of system, **testx** has changed in several potentially breaking ways. As usual I tried to contain the changes to such, that will not require changing of test scripts.

### runExcelSheet method is deprecated
*runExcelSheet* method is deprecated in favor of the more idiomatic *run* method. The signature remains the same so for all intents and purposes it is just renaming. *runExcelSheet* will be removed in the next major **testx** version.

### xls2test external parser is no longer support
**testx@2.0** drops integrated support for the external **xls2test** parsing service. This service adds too much hassle and was not really used. Please, create an issue if you still want to use it.

## Migrating from testx 0.x to 1.x
There are a few breaking changes in **testx 1.0** compared to **testx 0.x**, but you should only need to change your configuration file and not your tests.

### Reporting
Reporting is no longer done by **testx**. Instead you should take care of it yourself. I've pulled out (and refactored a bit) the old reporting code into a separate package [testx-jasmine-reporters](https://www.npmjs.com/package/testx-jasmine-reporters).

This lead to the removal of the onPrepare and onComplete methods from the **testx** API. These methods were only adding the jasmine reporters and sending test results, respectively, so there is no need for them anymore. You should just remove the calls to them from your config file.

### Adding objects, keywords and functions
There is a slight change in the **testx** API.

Instead of

	testx.addObjects(require './objects')
	testx.addObjects 'objects/objects.csv'
	testx.addKeywords(require './keywords')
	testx.addKeywords(require 'testx-pdf-keywords')
	testx.addFunctions(require './my-functions')

You will now do

	testx.objects.add(require './objects')
	testx.objects.add 'objects/objects.csv'
	testx.keywords.add(require './keywords')
	testx.keywords.add(require 'testx-pdf-keywords')
	testx.functions.add(require './my-functions')

## How does it work
**testx** aims to make web application testing easier by using keyword driven testing.

**testx** uses MS Excel sheets or YAML files as a platform for writing tests. Both file types have their pros and cons.

- **MS Excel** (*.xlsx, .xls*):
	- Pros - Essentially you write your tests in MS Excel, utilizing the computational power of MS Excel.
This will free you from having to implement all the things like generating random data, referring to values in other test steps. formatting dates, etc.
	- Cons
		- Version management is quite a hassle, especially if more people are working on the same test at the same time and a merge is required;
		- Script files are pretty big.

- **YAML** (*.testx, .yaml, .yml*):
	- Pros
		- Simple text based format. Version management is a breeze.
		- Syntax highlighting and auto-complete support (at least for the core keywords) via an [Atom plugin](http://testx.io/atom-language-testx) if you use *.testx* file extension.
	- Cons
		- No logic in the script itself. For example, if you need a random string, you have to implement it via a function or pass it through the initial test context.

However it is perfectly acceptable to mix and match between YAML and MS Excel based scripts. It is also possible to run a YAML based script from an MS Excel based one and vice versa. This is done with the [run](#core-keywords) core keyword.

### Test structure
The tests consist of *steps*. Each step consists of a *keyword* and *arguments*.

The keyword is an action or a check (or both, can be anything really).
The arguments consist of a name and a value. Both the name and the value can be literals, context references or object keys.

In MS Excel a test looks something like that (taken from the sample project):

|                   | url         |             |
| -------------     | ----------- | ----------- |
| **go to**         | /           |             |
|                   | **query-input** | **search-btn**  |
| **set**           | new york    |             |
|                   | **object**  | **timeout** |
| **wait to appear**| result-link | 4000        |
|                   | **result-link** |         |
| **check matches** | New York    |            ||

#### Keywords
You can think of the step as the action you want to perform using the provided arguments.
In this context the keyword is the action.

#### Objects
The other key component at work here is the **object map**.

It is a dictionary of *object keys* - the stuff you put in your scripts to identify objects on the screen - and *object locators*.

Object locators are simple objects consisting of *locator* and *value*.

The locator can be any of the supported protractor element selector types, i.e. *id*, *css*, *xpath*, etc.

The value is the actual value of the selector - "element-id", ".hidden.button", "//input[@type='button']", etc.

Clients (test projects) use the **addObjects** method to add to the object map. For example (from the sample project *conf.coffee*)

	testx = require 'testx'
	onPrepare: ->
		testx.objects.add require('./objects')

And in *objects/index.coffee* you'll have something like:

	module.exports =
	  "query-input":
	    locator: "css"
	    value: "input[name='q']"
	  "search-btn":
	    locator: "css"
	    value: "button[name='btnG']"
	  "result-link":
	    locator: "css"
	    value: "li.g a"

Objects can also be read from a CSV file like that ```testx.objects.add ./path/to/file.csv```.  The file looks like this:

	query-input,css,"input[name='q']"
	search-btn,css,"button[name='btnG']"
	result-link,css,"li.g a"


You can mix and match these object maps and can add as many as you like.

As of **testx 0.7.0** objects in the object map can be functions as well. This gives you the ability to parameterize object. This is easiest to explain with an example. Let's say you have this object definition:

	module.exports =
	  "query-input": (attr, val) ->
	    locator: "css"
	    value: "input[#{attr}='#{val}']"

It can then be used to set an *input* element with arbitrary name like so (in your Excel sheet):

|                 | query-input('name','q') |
| -------------   | ----------- |
| **set**         | something  ||

In the example above "name" and "q" will be passed to the object function as the *attr* and *val* parameters and the return value of the function will be used to locate the element. In this example the resulting locator will be "input[name='q']". The only requirement is that the parameters you pass have to be put in quotes. If you want to have a quote (') as part of a parameter you need to escape it using back slash (\\).

#### Behaviours
**testx** does its magic by augmenting the behaviour to the WebDriver elements. This is done by adding 3 functions to the WebDriver element:
 - **set** - used to act on element uniformly. Mainly used by the **set** keyword.
 - **get** - used to get the *perceived value* of the element. Mainly used by the **check ...** keywords.
 - **wait** - used to wait for element state. Mainly used by the **wait ...** keywords.

As of **testx 1.5.0** it is possible to add custom behaviour to objects in the object map. This is done by adding a *behaviour* attribute to the object definition. The *behaviour* is an object containing **get**, **set** and/or **wait** functions specific to this object. All these are optional - if omitted, the default behaviour will be used instead.

For example

	"query-input":
		locator: "css"
		value: "input[name='q']"
		behaviour:
			set: (val) -> @sendKeys val

will override the **set** function for only that particular object. The **this (@)** object in the function is the instance of the WebDriver element. The **get** and **wait** functions for this object will take the defaults.

## API
**testx** exposes the following interface:

- *run(scriptLocation..., initialContext)* - executes the test on the specified file path (and possibly Excel sheet) with the specified initial context.
- *runExcelSheet(filePath, sheetName, initialContext)* - **deprecated, use run instead**, executes the test on the specified file path and Excel sheet passing initial test context. The parameters are:
	*filePath* - path to the Excel file, can be absolute or relative to the execution root;
	*sheetName* - the name of the Excel sheet containing the test script;
	*initialContext* - the initial context of the run. A JSON object. Attributes in the context must have scalar value. The context can be referenced with the *{{contextVar}}* syntax where *contextVar* is the key of the attribute. The initial context is optional, defaulting to an empty object.
- *keywords* - the keywords extension end point; this object has two attributes and both are functions
	- get() - returns the raw keywords object, usually not something you'll need;
	- add(kwds) - makes the keywords passed as the only argument available to the current test run; adding a keyword with a name that already exists will overwrite the implementation of that keyword; the *kwds* argument can be
		- object containing custom keywords
		- parameterless function that returns a keywords object
- *objects* - the objects extension end point; this object has two attributes and both are functions
	- get() - returns the raw objects object, usually not something you'll need;
	- add(objs) - adds the objects passed as the only argument to the object map; adding an object with a name that already exists will overwrite the definition of that object; the *objs* argument can be
		- object containing custom your objects
		- parameterless function that returns objects object :-)
		- string that is assumed to be the path to a **CSV** file with your objects. The format of such a file is:

		"object name", "locator type", "locator"

		for example

		"loginPass", "css", "input.password"
- *functions* - the functions extension end point; this object has two attributes and both are functions
	- get() - returns the raw functions object, usually not something you'll need;
	- add(funcs) - makes the functions passed as the only argument available to the current test run context; adding a function with a name that already exists will overwrite the implementation of that function; the *funcs* argument can be
		- object containing custom function
		- parameterless function that returns a functions object
- *parsers* - the functions extension end point; this object has two attributes and both are functions
	- get(fileExtension) - returns the parser object associated with this file extension; if no *fileExtension* is passed the raw parsers object is returned;
	- add(parser, [extensions]) - adds (installs) a parser for the given (an optional) array of file extensions. If extensions parameter is present the parser will be associated with these file extensions as well as the file extensions declared by the parser itself (see parser interface below). The parser object has to implement the following properties:
		- parse(script) - parse the script (string) and return an executable **test** script (JSON object);
		- parseFile(scriptFile) - parse the script file (string) and return an executable **test** script (JSON object);
		- name - string; name of the parser;
		- version - string; version of the parser;
		- extensions - array of strings; supported extensions by this parser.

	Functions are invoked using the context resolution syntax, i.e. {{functionName}} (in the Excel sheet) will invoke the function *functionName*. Currently only functions without parameters are supported.
- *events* - the **testx** event emitter. This is a [Node.js EventEmitter object](https://nodejs.org/api/events.html). Available events are
	- testx/loaded - fired when *testx* is loaded; The handler function takes 1 argument - the **protractor.params** object the tests were started with;
	- script/start - fired before a *testx* script starts; The handler function takes 2 arguments - the script and the context;
	- script/done - fired after a *testx* script ends; The handler function takes 2 arguments - the script and the context;
	- specs/loaded - fired when Jasmine has loaded all specs, but before the execution has started; The handler function takes 1 argument - the Jasmine suite info object;
	- suite/start - fired when a **describe** starts to run; The handler function takes 1 argument - the result object containing meta data about the suite;
	- suite/done - fired when all of the child suites and specs are finished; The handler function takes 1 argument - the result object;
	- spec/start - fired when an **it** starts to run; The handler function takes 1 argument - the result object containing meta data about the spec;
	- spec/done - fired when an **it** (and associated *afterEach* function) is finished; The handler function takes 1 argument - the spec result object;

The Jasmine related events are implemented as a [custom Jasmine reporter](https://jasmine.github.io/2.1/custom_reporter.html).

## Prerequisites

**testx** will only work in protractor based projects. Supported protractor versions are 2.0.0 and up.

## Installation

Create a protractor project. For a sample project clone https://github.com/testxio/testx-quickstart

Add this module to your project:

	npm install testx --save

This is already done in the sample project so there you only need to:

	npm install

## Run

From within the test project directory:

	protractor conf.coffee --baseUrl=http://google.com

## Configuration

All **testx** configuration lives in your protractor configuration file under *params.testx*, for example (in coffeescript):

	params:
		testx:
      			logScript: true
      			actionTimeout: 4000

The available configuration options are
 - **logScript** - if *true* **testx** will log the test script (JSON) on the console before executing it; defaults to *false*.
 - **actionTimeout** - the timeout in milliseconds before a *get* or *set* action will fail, for example because the target element is not visible; defaults to 5000.

It is also possible (since testx@2.4.0) to provide configuration directly in your *package.json* file. In this case you need to add the **testx** parameters under a *testx* field in your *package.json*, for example:

```
...
"testx": {
	"logScript": true
	"actionTimeout": 4000
}
...
```

The configuration parameters specified in the protractor configuration (config file or command line) take precedence over the ones specified in *package.json*.

## Core keywords

**testx** comes with a simple set keywords that can be extended/overriden from the project.
See the **keywords.add** method for details.

Predefined keywords are:

*object key* - the object key as specified in the object map. The keyword is applied to this object (DOM element).
*value of the object* - this string value depends on the HTML type of the object. For example it will be the text of a label or the value attribute of an input element.

| Keyword                | Argument name | Argument value  | Description | Supports repeating arguments |
| ---------------------- | ------------- | --------------- |------------ | ---------------------------- |
| check equals           |               || Checks if the value of the object is exactly equal to the expected value. |            |
|                        | *object key*  | *expected*      || Yes |
| check not equals       |               || Checks if the value of the object doesn't equal to the specified value. |            |
|                        | *object key*  | *expected*      || Yes |
| check matches          |               || Checks if the value of the object matches the expected regular expression. ||
|                        | *object key*  | *expected regex* || Yes |
| check not matches      |               || Checks if the value of the object doesn't match the specified regular expression. ||
|                        | *object key*  | *expected regex* || Yes |
| check exists           |               || Checks if the object is present or not. ||
|                        | *object key*  | true / false (string) || Yes |
| check enabled          |               || Checks if the object is enabled or not, applicable for input controls. ||
|                        | *object key*  | true / false  || Yes |
| check readonly          |               || Checks if the object is readonly or not, applicable for input controls. ||
|                        | *object key*  | true / false (string) || Yes |
| clear local storage    |               |                 | Clears local storage. This keyword has no arguments. ||
| delete cookies		 |               |                 | Deletes all application related cookies. This keyword has no arguments. ||
| go back                |               |                 | Simulates pressing the **Back** browser button. |  |
| go forward             |               |                 | Simulates pressing the **Forward** browser button. |  |
| go to                  |               |                 | Navigate to a (relative to the --baseUrl) url. |  |
|                        | url           | the url to navigate to || No |
| ignore synchronization |               |                 | Turn page synchronization for angular apps on or off. ||
|                        | ignore        | true / false (string) || No |
| refresh page           |               |                 | Simulates pressing the **Refresh** browser button. |  |
| respond to dialog      |               |                 | Respond to browser dialog window, simulates clicking **Ok** or **Cancel**. ||
|                        | response  | ok / cancel || Yes |
| save                   |               |                 | Save the value of the object to the specified variable. The saved value can then be referred to by putting the variable name in double curly brackets like so *{{varname}}*. This can be done in both argument name and argument value. ||
|                        | *object key*  | *variable name* || Yes |
| send keys              ||| Send key strokes to focussed element, supporting specials keys, such as [TAB] and [ENTER]. Supported key strokes can be found here: http://selenium.googlecode.com/git/docs/api/javascript/enum_webdriver_Key.html ||
|                        | *ignored*  | *value*         || Yes |
| set                    ||| *sets* the value to the object; the exact action depends on the HTML type of the object. For example the value will be filled in an input box. If the value is empty string the action is **click**. ||
|                        | *object key*  | *value*         || Yes |
| sleep                  ||| Pause the execution of the script. ||
|                        | seconds       | number of seconds to sleep  || No |
|                        | milliseconds  | number of milliseconds to sleep  || No |
| switch to              ||| Switches the current action context to a different iframe or window. |  |
|                        | title         | title of the window you want to switch to| only one of *title* or *frame* can be specified | No |
|                        | frame         | *object key* identifying an iframe you want to switch to | only one of *title* or *frame* can be specified | No |
| wait to appear         ||| Wait for all the specified objects to appear and fail if this does not happen before the timeout. Argument names must be unique (for this instance of the keyword), but are otherwise ignored. ||
|                        | *ignored*     | *object key*    || Yes |
|                        | timeout       | the timeout in milliseconds || No |
| wait to disappear      ||| Wait for all the specified objects to disappear and fail if this does not happen before the timeout. Argument names must be unique (for this instance of the keyword), but are otherwise ignored. |            |
|                        | *ignored*    | *object key*    || Yes |
|                        | timeout       | the timeout in milliseconds || No |
| run                    ||| Execute the test script in the specified file (and sheet) passing the remaining arguments as variables to that execution. ||
|                        | file          | full file path  | Optional; Can be omitted if the sheet is in the current file. | No |
|                        | sheet         | the name of the Excel sheet |Optional; Only required when the script is in an Excel file| No |
|                        | *var name*    | *var value*     || Yes |
| put                    ||| Puts the arguments in the test context. Access the *var value* in subsequent steps with *{{var name}}*||
|                        | *var name*    | *var value*     || Yes |

## Additional keyword packages
| Npm package | Description |
| ----------- | ----------- |
|[testx-http-keywords](https://www.npmjs.com/package/testx-http-keywords)|Keywords to send simple http requests using the testx library.|
|[testx-file-keywords](https://www.npmjs.com/package/testx-file-keywords)|Keywords to test file (text and pdf) content using the testx library.|
|[testx-pop3-keywords](https://www.npmjs.com/package/testx-pop3-keywords)|Keywords to test mailserver using pop3.|
|[testx-postgres-keywords](https://www.npmjs.com/package/testx-postgres-keywords)|Keywords to test postgres db.|
|[testx-soap-keywords](https://www.npmjs.com/package/testx-soap-keywords)|Extension for testx to test soap services.|

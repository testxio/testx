[![npm version](https://badge.fury.io/js/testx.svg)](https://badge.fury.io/js/testx)
[![Build Status](https://travis-ci.org/testxio/testx.svg?branch=master)](https://travis-ci.org/testxio/testx)

testx
=====

A library for executing keyword driven tests with Protractor.

- [What is testx?](#what-is-testx)
- [How does it work](#how-does-it-work)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Run](#run)
- [Configuration](#configuration)
- [Core keywords](#core-keywords)
- [Additional keyword packages](#additional-keyword-packages)

## What is testx?
Testx is a library for executing keyword driven tests with Protractor. It provides a very simple abstraction for writing logicless test scripts. A **testx** test script is just a list of steps, that are executed in sequence. Each step performs an action and/or checks the state of the application under test against expected conditions. This intuitive concept makes the tests easy to write and read. While **testx** is built on top of Protractor it does not require programming knowledge. For example:

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
*Explaination*:
By using build-in core **testx keywords** `go to`, testx passes the provided *url* to Protractor's `browser.get()` function. The `set` keyword will execute `element(by...)` function depending on the parameters used. In this case it first executes `element(by.name())`, because a string is provided `testx.io`it will also run `sendKeys()` and parse the provided string to the function. Leave it emply, `set` keyword it will run `click.()` on the element. 


## How does it work
**testx** aims to make web application testing easier by using keyword driven testing.

**testx** uses YAML files as a platform for writing tests. 

- **YAML** (*.testx, .yaml, .yml*):
	- Pros
		- Simple text based format. Version management is a breeze.
		- Syntax highlighting and auto-complete support (at least for the core keywords) via an [Atom plugin](http://testx.io/atom-language-testx) if you use *.testx* file extension.
	- Cons
		- No logic in the script itself. For example, if you need a random string, you have to implement it via a function or pass it through the initial test context.



### Test structure
The tests consist of *steps*. Each step consists of a *keyword* and *arguments*.

The keyword is an action or a check (or both, can be anything really).
The arguments consist of a name and a value. Both the name and the value can be literals, context references or object keys.

For example the test script below does a search on a website and check if the search result is expected.
```
- go to:
    url: / 
- set:
    search-btn:
	query-input: 'new york'
- wait to appear
    el1: resultLink
	timeout: 4000
- check matches:
	resultLink: 'New York'
```
The `url` is pre-define as `baseUrl` in the config file. `search-btn` and `resultLink` are objects that are pre-defined in a separate document. You can think them as *variables* that are defined else where.  

#### Keywords
You can think of the step as the action you want to perform using the provided arguments.
In this context the keyword is the action.

#### Objects
The other key component at work here is the **object map**.

It is a dictionary of *object keys* - the stuff you put in your scripts to identify objects on the screen - and *object locators*. Think of them as a dictonary of page objects assigned as variables to use in your test script. So instead of 
```
- set:
    name('q'): testx.io
    css("button[name='btnG']"):
```
You define them in a separate coffee file first, for example in `objects/index.coffee`:
```coffeescript
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
```
Then include them by use **addObjects** method in the `conf.coffee` file:
```coffeescript
testx = require `testx`
onPrepare: ->
	testx.objects.add require('./objects')
```
And then call them within your test script:
```
- go to:
    url: / 
- set:
    search-btn:
	query-input: 'new york'
- wait to appear
    el1: resultLink
	timeout: 4000
- check matches:
	resultLink: 'New York'
```

Object locators are simple objects consisting of *locator* and *value*.

The locator can be any of the supported protractor element selector types, i.e. *id*, *css*, *xpath*, etc.

The value is the actual value of the selector - "element-id", ".hidden.button", "//input[@type='button']", etc.

You can expand the page objects by creating separate coffee files for each page and include them in your `conf.coffee`. 

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
```coffeescript
params:
  testx:
    logScript: true
    actionTimeout: 4000
```
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
| check matches          |               || Checks if the value or attributes (given as key-value pairs) of the object matches the expected regular expression. ||
|                        | *object key*  | *expected regex* || Yes |
|                        | *object key*  | *dictionary of atttibute: regex* | e.g.: `alt: Something nice` or `height: ^\d+$` | Yes |
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

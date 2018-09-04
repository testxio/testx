[![npm version](https://badge.fury.io/js/testx.svg)](https://badge.fury.io/js/testx)
[![Build Status](https://travis-ci.org/testxio/testx.svg?branch=3.x)](https://travis-ci.org/testxio/testx)

testx
=====

A library for executing keyword driven tests with Protractor.

- [What is **testx**](#what-is-testx)
  - [Core principles](#core-principles)
- [Getting started](#getting-started)
- [Concepts](#concepts)
- [API](#api)
- [Core keywords](#core-keywords)

## What is **testx**
**testx** is a library for E2E keyword driven tests. **testx** IS NOT a framework - you can use it in your [Protractor](http://www.protractortest.org) project to make test automation a breeze.
**testx** is meant for testers. It requires a very limited set of technical skills. It is even suitable for the business people in your project.

### Core principles
**testx** aims to be **simple**, **extensible** and **easy to integrate**.

#### Simple
Simplicity is the defining quality of **testx**. It has very few concepts and avoids variations whenever possible. The goal is to have non-technical people feel right at home when automating their tests. This is why **testx** tries to think about everything from the user point of view.

#### Extensible
In order to make **testx** as simple as possible we need to make certain sacrifices. The main of those is the fact that **testx** is logic-less. This means that in a **testx** script there are no branches and no loops. A **testx** script is just a list of steps.

However, sometimes you need something more complex, like a loop, in your tests. Because of situations like this **testx** makes it very easy to extend it, while keeping the core principle of simplicity intact.

#### Easy to integrate
**testx** relies on [protractor](http://protractortest.org) to do the heavy lifting - anything you can do with protractor is still doable. A very important part of this "everything" is the ability to integrate your test execution into your continuous deployment pipeline. **testx** tries really hard to not make this any harder.

## Getting started

### Creating a **testx** project
A **testx** project is just a [protractor](http://protractortest.org) project. Just install **testx** as a dependency and you can start running your **testx** scripts in (a part of) your test run.

#### The **testx** CLI
In line with the core concept of **simplicity**, **testx** provides you with a [CLI](https://www.npmjs.com/package/@testx/cli). It helps you create a **testx** project containing useful examples. Easy!

## Concepts
The main thing that **testx** does is to execute (run) a **testx** script. This happens in your protractor specification and looks like this:
```JavaScript
describe("My first", () =>
  it("testx test!", () =>
    testx.run("tests/scripts/my-first-test.testx")));
```
All the rest of it is in the **testx** script file.
### Scripts and steps
Each **testx** script is just a list of **steps**. These steps are synchronous and are executed in sequence. By default a script is put in a *.testx* file. By default it is formatted as a YAML file. Every step consists of two things - the keyword to be executed at this step, and the parameter(s) of the execution. In general the steps are just actions/checks performed on objects (elements). Simple!

Here is an example:
```YAML
- go to: /
- set:
    searchBox: "testxio\n"
- check matches:
    orgName: 'testxio'
```
There are 3 **steps** in this script - **go to**, **set** and **check matches**.
- The **go to** keyword is responsible for taking us to a URL - "/" is a URL relative to whatever *baseUrl* (test run parameter) is.
- The **set** keyword types "testxio" in the "searchBox" object (it happens to be an input box, we'll talk about objects later) and presses the Enter key ("\n").
- The **check matches** checks that the content of the "orgName" object (an H1 html element in this case) RegEx match the text "testxio".

### Keywords
Keywords tell **testx** what action you want it to perform, the parameters of the keyword tell it which element (for example) you want to target. The combination of these two concepts represents a **step**. The type of action can be a click on a button or a link, typing something into an input box, etc. Keywords usually target (do something with) objects - the elements in the browser - or the **test context** (more on that later). The core keywords, the ones that come with **testx**, are generally about mimicing actions, that a user performs in the browser. A [list of all core action](#core-keywords) is available further in this documentation.

### Objects
Objects in **testx** are an abstraction of the HTML elements in the browser. You can think of an object as **the name of a particular, actionable element**. They are discovered by **testx** with a **locator**.

You need this sort of abstraction to shield you from changes in the exact HTML structure of the application under test. With an object, whenever a "logical" element on the screen changes (e.g. a different xpath to locate the element) you'll just change its locator and that's it, you don't need to change any of your scripts.

Locators are organized into what we refer to as **the object map**, but this is just a fancy name for a JSON object, where the keys are the names of the objects and the values are the locators.

The names of the objects (in the object map) are how you will refer to this object in your **testx** scripts.

****** Needs a simple example with a locator and an example with an object as a function: Since objects are actually html locators you can also define them as a function. E.g:
resLink(name) -> {
    return balbal
}

#### Default behaviour
Key characteristic of **testx** is its simplicity, its ease of use. When it comes down to dealing with objects, this means that **testx** knows how to deal with them by default. In other words, when you tell **testx** to **set** a particular object it knows what to do with it - it will type into input boxes, select from dropdowns or click buttons.

#### Custom behaviour
Sometimes you want to do something that is not common with a particular object on the screen or maybe you have a complex object that behaves in a very specific way (think of an editor, for example). In such a case **testx** lets you define the behaviour of this element. This means that when you **set** or **get** (used in checks, for example) this object, a custom code will be executed.

To do this, you need to provide a **behaviour** property to the object. It can have any or all of 3 polymorphic properties - **get**, **set** and **wait**. **Get** is used to retrieve the value of the element and is used by **testx** when it performs checks. **Set** is used by the **set** keyword and specifies the way **testx** manipulates this object. **Wait** describes how **testx** will know if the objects is on the screen and ready for manipulation.

****** NEEDS EXAMPLE ******

### Test context
The test context includes all *variables* (and functions) you may need during the execution. It allows you to reuse your scripts. For example in this (contrived) script:

```YAML
- go to: ${customUrl}
```

you can pass *customUrl* in the test context and **testx**  will navigate to that different for every execution URL. This let's you run the same tests against different deployments, for example.

****** NEEDS EXAMPLE OF HOW TO SET customUr or point to API where you actually set customUrl instead of someVar for example ******

### Parsers
It is possible to not use YAML format for your scripts, but instead implement a custom parser for the format you prefer. **TBA**.

### Reporters
One of the most important things in every test execution is reporting the results. There are 3 types of default reporters, but you can implement your own (**TBA**).

The default ones are **console**, **junit** and **HTML**. They are found in the [testx-jasmine-reporters](https://github.com/testxio/testx-jasmine-reporters) project - check it out to see how to use the reporters.

## API
### Run a script
The **testx** API is pretty simple. The only thing you absolutely need to know is how to run a **testx** script. Once you have *require*-ed **testx** (you have to do this in the *onPrepare* function of your Protractor configuration) you can run a **testx** script in you specs like:

```JS
const context = {
  someVar: 1,
  anotherVar: "text",
  someFunc: () => "more text"
}

testx.run("path/to/the/testx-script.yml");
testx.run("path/to/the/testx-script.yml", context);
```

### Add objects to the test execution
```JS
testx.objects.add(myObjectsDict);
```

Usually you'll have the objects defined somewhere else and a lot more common is:
```JS
testx.objects.add(require("path/to/myObjects.js"));
```

It is possible to use a CSV file to define your objects. In this case you'd do:
```JS
testx.objects.add("path/to/myObjects.csv");
```

### Augment the test context
Adding variables and functions to the context is also very simple:
```JS
testx.context.add({"myVar": "some text"});
```

*** Add exmple of add foo() function.

### Add custom keywords to the execution
It is of course possible to add custom keywords to the execution. This is very common for non-trivial tests.

You'll add keywords like so:
```JS
const keywords = {
  myKwd: (kwdArguments, context) => //do something here
}

testx.keywords.add(keywords);
```

And then use them like so:
```yaml
- myKwd:
    firstArg: 1
    secondArg: this is another argument
```

## Core keywords
These are the default keywords that come with **testx**.

### Set
**Set** performs an action on an element. It is polymorphic, meaning that the action depends on the type of the element. For example a **set** on an *input* will fill it in, while a **set** on a *button* will click it.
```YAML
- set:
    myInput: this text goes in
    myButton: null
```

In this example *myInput* is (the name) of an object referencing an *input* element and "this text goes in" will be "typed" in the input element. On the other hand *myButton* is a button element that will be clicked. Actions on the elements are ordered, in this example the text will be typed in the input box first and only then the button gets clicked.

Passing **null** as the action means **click**. So
```YAML
- set:
    myInput: null
```
will cause **testx** to only click in the input box *myInput*.

Default actions per element type are: **TBA**

### Check
Check the text, attribute value, existence, enabled or readonly properties of an object.
```YAML
- check equals: // This will check equals the attributes of the object.
    resLink('testxio'):
      href: https://github.com/testxio
      host: github.com
      isConnected: 'true'
      nodeType: '1'
- check matches: // // This will check matches the attributes of the object.
    resLink('testxio'):
      href: github\.com/\w{4}xio
      localName: \w
- check equals: // This will check ?? (text?) if so, change order to reflect order in description above the example,
    searchBox: testxio
    resLink('testxio'): testxio · GitHub
- check not equals:
    searchBox: testx1111.io
    resLink('testxio'): something else
- check matches:
    searchBox: test[x|z].o
    resLink('testxio'): tx\w{2} · GitHub
- check not matches:
    searchBox: testx1111\.io
    resLink('testxio'): test11o
- check exists:
    resLink('testxio'): true
    resLink('no such thing'): false
- check enabled:
    resLink('testxio'): true
    searchBox: true
- check readonly:
    resLink('testxio'): false
    searchBox: false
```

### Wait
Wait for the (dis)appearance of an object.
```YAML
- wait: googleSearchForm
- wait to appear: googleSearchForm (is there a difference between wait / wait to appear? shorthand?)
- wait:
    - resLink('{{match}}') << What does '{{match}}' mean?
    - googleSearchForm
- wait:
    to: appear
    objects:
      - resLink('{{match}}')
- wait to appear:
    - resLink('{{match}}')
- wait to appear:
    timeout: 2s
    objects:
      - resLink('{{match}}')
- wait:
    to: disappear
    objects:
      - resLink('no such thing')
- wait to disappear: resLink('no such thing, really')
- wait to disappear:
    - resLink('no such thing, really')
```

### Navigational keywords
```YAML
- go to:
    url: / # go to a path relative to the baseUrl
- go to: /test/index.html # shortcut to the version above
- go to: http://testx.io
- go back
- go forward
- refresh page
```

### Expect
Assertions. **expect result** checks the result of the keyword executed before it. It can be used as a keyword, but it can be passed as a parameter to any other keyword as well. In the example below the **id** is a custom keyword that just returns its parameters, i.e. they are the result of the keyword. (in the example you use this + a function that does the exact same but is called 'custom kwd that just returns params')

These are useful when you want to do some processing of a text, that you get off the screen, and only then do assert. Use the **check** keywords when wanting to directly assert values of objects.
```YAML
- go to:
    url: / (what is actually in the 'result object' of a (url) keyword?)
    expect result:
      to equal: /
      not to equal: f
      to match: .
      not to match: d
- custom kwd that just returns params: // Is id function
    test: test123
    expect result:
      to equal:
        test: test123
      not to equal:
        test: sdaf
- expect:
    ${$result.test}:
      to equal: test123
      not to equal: something else
      to match: \w{4}\d{3}
      not to match: completely different
- put:
    someVar: 1
- expect:
    ${someVar}:
      to equal: 1
- id:
    test: test123
- expect result:
    to equal:
      test: test123
```

### Run
Runs another **testx** script, optionally passing it a context: << Will it also get the context of the current script?? >>
```YAML
- run:
    script: tests/scripts/sample.testx # the script to run
    context: # this goes in the testx context
      myVar: myVal
- run: tests/scripts/no-context.testx # no context shortcut
```

### Context manipulation keywords
Please explain why there is a 'save'? Seems redundant, or is it 'smart' (polymorph) in regards to the object?

#### Put
Puts stuff in the test context of **testx**.
The following example puts 2 values in the test context - an object bound to the *myFirstVar* variable and an array bound to the *secondVar* variable. These values can be used in subsequent steps with `${myFirstVar}` and `${secondVar}`
```YAML
- put:
    myFirstVar:
      one: two
      three:
        - four
        - and five more
      six: 'seven nine,ten'
    secondVar:
      - nine
      - ten
```
#### Save
Saves the current value of an object into a context variable. In the example below the value (e.g. text) of *myElement* is saved to *myContextVar*; you'll be able to retrieve it in subsequent steps with `${myContextVar}`
```YAML
- save #
    myContextVar: myElement
```

### Browser keywords
```YAML
- clear local storage # Just local storage or also session storage ? Is it possible to set local / session storage?
- delete cookies
- ignore synchronization: true
- ignore synchronization: yes
- ignore synchronization: false
```

#### Switch to a different window or frame
This keyword will switch the test execution to different window or frame.
```YAML
- switch to:
    title: "My new window"
- switch to:
    frame: "My new frame ID"
```

#### Respond to a dialog
```YAML
- respond to dialog: OK
- respond to dialog:
    response: ok
- respond to dialog:
    response: Cancel
```

### Debugging keywords
The **sleep** keyword will pause the execution of the test. It is strongly recommended that you only use it only while developing your tests.
```YAML
- sleep: 5s # the execution will stop here for 5 seconds
- sleep: 500ms # the execution will stop here for half a second
```

## Run configuration
TBA

## Plugins
A core characteristic of **testx** is its extensibility. This means it is very easy to develop keywords packages, for example. It is of course possible to extend **testx** in other areas of functionality, but 99% of the time you'll extend with a keyword package.

Here is what we have so far:
| Npm package | Description |
| ----------- | ----------- |
|[testx-http-keywords](https://www.npmjs.com/package/testx-http-keywords)|Keywords to send simple http requests using the testx library.|
|[testx-file-keywords](https://www.npmjs.com/package/testx-file-keywords)|Keywords to test file (text and pdf) content using the testx library.|
|[testx-pop3-keywords](https://www.npmjs.com/package/testx-pop3-keywords)|Keywords to test mailserver using pop3.|
|[testx-postgres-keywords](https://www.npmjs.com/package/testx-postgres-keywords)|Keywords to test postgres db.|
|[testx-soap-keywords](https://www.npmjs.com/package/testx-soap-keywords)|Extension for testx to test soap services.|

## Editor integration
To make developing tests easier we've developed an [Atom syntax plugin](https://atom.io/packages/language-testx).

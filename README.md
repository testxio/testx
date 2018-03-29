[![npm version](https://badge.fury.io/js/testx.svg)](https://badge.fury.io/js/testx)
[![Build Status](https://travis-ci.org/testxio/testx.svg?branch=3.x)](https://travis-ci.org/testxio/testx)

testx
=====

A library for executing keyword driven tests with Protractor.

- [What is **testx**](#what-is-testx)

## What is **testx**
**testx** is a library for E2E keyword driven tests. **testx** IS NOT a framework - you can use it in your [Protractor](http://www.protractortest.org) project to make test automation a breeze.
**testx** is meant for testers. It requires a very limited set of technical skills. It is even suitable for the business people in your project.

## Core principles
**testx** aims to be **simple**, **extensible** and **easy to integrate**.

### Simple
Simplicity is the defining quality of **testx**. It has very few concepts and avoids variations whenever possible. The goal is to have non-technical people feel right at home when automating their tests. This is why **testx** tries to think about everything from the user point of view.

### Extensible
In order to make **testx** as simple as possible we need to make certain sacrifices. The main of those is the fact that **testx** is logic-less. This means that in a **testx** script there are no branches and no loops. A **testx** script is just a list of steps.

However, sometimes you need something more complex, like a loop, in your tests. Because of situations like this **testx** makes it very easy to extend it, while keeping the core principle of simplicity intact.    

### Easy to integrate
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
### Scripts
Each **testx** script is just a list of steps. These steps are synchronous and are executed in sequence. By default the scripts are encoded it *.testx* files, that are just YAML files. Every step has single key - the name of the keyword to be executed at this step. The value of assigned to this key is the parameter of the keyword. In general the steps are just actions/checks performed on objects (elements). Simple!

Here is an example:
```YAML
- go to: /
- set:
    searchBox: "testxio\n"
- check matches:
    orgName: 'testxio'
```
There are 3 steps in this script - **go to**, **set** and **check matches**.
- The **go to** keyword is responsible for taking us to a URL - "/" is a URL relative to whatever *baseUrl* (test run parameter) is.
- The **set** keyword types "testxio" in the "searchBox" object (it happens to be an input box, we'll talk about objects later) and presses the Enter key ("\n").
- The **check matches** checks that the content of the "orgName" object (an H1 html element in this case) RegEx match the text "testxio".

### Keywords
### Objects
#### Default behaviour
#### Custom behaviour
### Test context
	Functions?
### Parsers
### Reporters

## API
### **testx** API
### Core keywords

## Plugins

## IDE integration

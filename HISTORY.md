New in version 1.11.0
====================
- Inherit parent context when using the *run* keyword.

New in version 1.10.1
====================
- Using [testx-xlsx-parser@0.7.1](http://testx.io/testx-xlsx-parser/releases/tag/0.7.1) for fixed version of the **LEFT** formula.

New in version 1.10.0
====================
- Added **put** keyword for putting stuff in the test context during test run.

New in version 1.9.4
====================
- Improved handling of the *stale element* problem when waiting for an element to disappear.

New in version 1.9.2
====================
- Trying to handle the infamous *stale element* problem when waiting for an element to disappear.

New in version 1.9.0
====================
- Using testx-xlsx-parser@0.7.0 for correctly converting OpenOffice line endings.
- Fix for *getting* multiple elements
- Fix for **check exists**

New in version 1.8.3
====================
Using testx-xlsx-parser@0.6.3 for a fix for default (non-localized) formats.

New in version 1.8.1
====================
Using testx-xlsx-parser@0.6.1 for a fixed version of MID.

New in version 1.8.0
====================
- Using [testx-xlsx-parser@0.6.0](http://testx.io/testx-xlsx-parser/releases/tag/0.6.0). to add basic cell format internationalization. Set locale in the configuration files or with:

```
--params.testx.locale=NL
```

- Removed redundant dependencies.
- Updated dependency versions to latest.
- Merged PR for *check exists* documentation.

New in version 1.7.1
====================
Fixed a regression in the **save** keyword caused by 1.7.0.

New in version 1.7.0
====================
Test run parameters are now available in the excel sheet (run context) via {{params.paramName}} syntax.

New in version 1.6.0
====================
New core keywords:
- check not equals
- check not matches
- check enabled
- check readonly
- delete cookies
- respond to dialog
- send keys

New in version 1.5.2
====================
Using testx-xlsx-parser@0.5.2, that fixes a problem with non-existent sheets.

New in version 1.5.1
====================
Fixed regression in parameterized objects.

New in version 1.5.0
====================
Added the ability to attach custom behaviour to objects in the object map.

New in version 1.4.16
====================
Fixed regression introduced in 1.4.15 - **set** did not work correctly when setting *select* elements.

New in version 1.4.15
====================
Fixed generic object **set** for running on OSX.

New in version 1.4.14
====================
 - Removed debug output in default set keyword implementation.
 - You can omit the *file* argument when using the *run* keyword. In that case the current file is going to be used.

New in version 1.4.11
====================
Improved the synchronization of 'get'-related keywords (check...) with stronger argument order guarantees.

New in version 1.4.10
====================
Improved the synchronization of 'set' keyword with stronger argument order guarantees.

New in version 1.4.9
====================
Using testx-xlsx-parser@0.5.1 to fix VLOOKUP Excel function to work with absolute ranges.

New in version 1.4.8
====================
Using testx-xlsx-parser@0.5.0 to implement VLOOKUP Excel function.

New in version 1.4.7
====================
Fix: Error when object functions arguments contain parentheses.

New in version 1.4.6
====================
Using testx-xlsx-parser 0.4.1.

New in version 1.4.5
====================
Using testx-xlsx-parser 0.4.0.

New in version 1.4.4
====================
Using testx-xlsx-parser 0.3.6.

New in version 1.4.3
====================
 - Improved date treatment (more Excel-like) when using native parsing (via testx-xlsx-parser 0.3.5).
 - Improved concatenation support when using native parsing (via testx-xlsx-parser 0.3.5).

New in version 1.4.2
====================
 - Fix: Warn (but do not fail) on non-implemented Excel function when using native parsing (via testx-xlsx-parser 0.3.4).
 - Fix: Handle keywords without arguments correctly when using native parsing (via testx-xlsx-parser 0.3.4).

New in version 1.4.1
====================
Fix: Keep root context when using the native Excel parser (via testx-xlsx-parser 0.3.3).

New in version 1.4.0
====================
Extended Excel functions and (cross-sheet) reference support with the native Excel parser (via testx-xlsx-parser 0.3.1).

New in version 1.3.5
====================
 - Fix: *check ...* keywords fail on non string values.
 - Using testx-xlsx-parser 0.2.2
 - Fix: Variables containing states were not handled correctly by the context resolver.

New in version 1.3.1
====================
 - Fix: Wait to appear keyword uses default/action timeout when no timeout is given.

New in version 1.3.0
====================
 - Improved reporting of assertion failures - displaying file name, sheet name and row number of failing assertion.
 - Fix: incorrect value retrieval of input boxes.

New in version 1.2.1
====================
Fixed async problem with the Excel runner.

New in version 1.2.0
====================
Exposed the generic runScript method in the testx API. Used for implementing runners for non-Excel based test scripts, for example scripts in Google Sheets.

New in version 1.1.0
====================
- Improved error logging when trying to execute a missing XLSX file.
- Improved console logging of step arguments.
- Explicit handling of check boxes and radio buttons.

New in version 1.0.1
====================
- Corrected a typo in the documentation.
- Added missing history for 1.0.0.

New in version 1.0.0
====================
- Reporting removed from **testx**. See [testx-ictu-reporter](https://www.npmjs.com/package/testx-ictu-reporter) package.
- Change in the **testx** interface (see documentation).

New in version 0.7.4
====================
- Improved parsing of parameters when using object map functions.
- Improved documentation.

New in version 0.7.3
====================
Improved documentation.

New in version 0.7.2
====================
- Improved documentation.
- Future proof console log coloring.

New in version 0.7.1
====================
Refactoring: pulled out the native XLSX script parsing in a separate project (and npm package)  [testx-xlsx-parser](http://github.com/greyarch/testx-xlsx-parser).

New in version 0.7.0
====================
Allowing functions in the object map.

New in version 0.6.0
====================
Added native parsing for XLSX files. When the *xls2testUrl* parameter is not provided the native parsing will be used. Custom date formatting of the online service is not supported yet. No i18n.

Improved the error reporting when using an object that is not defined in the object map.

New in version 0.5.1
====================
Fixes for *wait to appear* and *wait to disappear* keywords.

New in version 0.5.0
====================
Added the following new keywords
- *go forward* - simulates a click on the **Forward** browser button
- *go back* - simulates a click on the **Back** browser button
- *refresh page* - refreshes the current page
- *switch to* - switches the action to another:
  - window, using the **title** argument
  - frame, using the **frame** argument

New in version 0.4.0
====================

- It is now possible to put (context resolvable) variables in the argument names as well as argument values.

New in version 0.3.6
====================

- Bug fix for *testx.logScript*.

New in version 0.3.5
====================

- Test script file name and sheet name are now printed in the console in cyan instead of in red.
- Printing the entire script on start is conditional on *testx.logScript* parameter; defaults to false.
- Setting now waits for the element to be clickable instead of just visible.
- Fix for getting from a *select* element - now returns just the selected options text.
- Added release notes file (this document).

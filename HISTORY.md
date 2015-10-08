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

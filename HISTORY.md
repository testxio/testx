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

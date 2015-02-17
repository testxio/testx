_ = require 'lodash'

module.exports = ->
  _.assign(objects, require('./alerts'))
  _.assign(objects, require('./inlogpagina'))
  _.assign(objects, require('./overzichtBeheerder'))
  _.assign(objects, require('./overzichtBeheerderDetailsHouder'))
  _.assign(objects, require('./overzichtBeheerderDetailsPersoon'))
  _.assign(objects, require('./overzichtPersoon'))
  _.assign(objects, require('./overzichtHouder'))
  _.assign(objects, require('./overzichtKoppelingen'))
  _.assign(objects, require('./overzichtHouderDetailsPersoon'))

objects =
#digid mock pagina
  "burgerservicenummerInput":
    locator: "id"
    value: "authentication_digid_bsn"
  "inloggenDigidmock":
    locator: "xpath"
    value:  "//input[@name='commit']"

#active directory beheer mock pagina
  "loginAdminRol":
    locator: "id"
    value: "role"
  "loginAdminButton":
    locator: "css"
    value:  "button.btn.btn-primary"

#eherkenning mock pagina
  "eherkenningFormKvkNummerInput":
    locator: "id"
    value: "kvk"
  "eherkenningButtonLogin":
    locator: "css"
    value: "button.btn.btn-primary"
  "eherkenningTextMockName":
    locator: "css"
    value:  "h1"

#header
  "genericHeaderLogo":
    locator: "id"
    value: "logo"
  "genericHeaderApplicationName":
    locator: "id"
    value: "app-name"
  "genericHeaderMainMenu":
    locator: "id"
    value: "main-navigation"
  "genericHeaderUserName":
    locator: "css"
    value: ".login > span"
  "genericHeaderButtonLogoff":
    locator: "css"
    value: "a.loggout-link"

#footer
  "genericFooterContainer":
    locator: "id"
    value: "footer-container"
  "genericFooterContent":
    locator: "css"
    value: ".footer-content"

#errors
  "genericTitleErrorNotFound":
    locator: "css"
    value: ".zone > h1"
  "genericTextErrorNotFound":
    locator: "css"
    value: ".zone > p"

#pagetitle
  "pageTitle":
    locator: "css"
    value: "head > title"

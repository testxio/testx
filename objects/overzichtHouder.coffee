module.exports =
#titles
  "overzichtTitleBedrijfsnaam":
    locator: "id"
    value: "page-header"
  "overzichtTitleKoppelmetPersoon":
    locator: "css"
    value: "legend"
  "overzichtTitleBSN":
    locator: "css"
    value: "div.ng-pristine > label"
  "overzichtTitlePersoonGebDatum":
    locator: "css"
    value: "div.form-group  > label"
  "overzichtTitleGegevensHouder":
    locator: "css"
    value: "div.col-xs-6 > div > h2"
  "overzichtTitleAlleKoppelingen":
    locator: "css"
    value: "h2.ng-binding"

#text
  "overzichtTextInfoHouder":
    locator: "css"
    value: "#main-content > div > p"
  "overzichtTextBsnError":
    locator: "css"
    value: "#houderOverzichtInputBsn .help-block:not(.ng-hide)"
  "overzichtTextDateBirthError":
    locator: "css"
    value: "#houderOverzichtInputGeboorteDatum .help-block:not(.ng-hide)"
  "overzichtTextDateBirthNotEqualBRP":
    locator: "css"
    value: "p.ng-binding.ng-scope"
  "overzichtTextGegevensHouder":
    locator: "css"
    value: ".col-xs-6 > div > p"

#links
  "overzichtLinkLeesVerderHouder":
    locator: "css"
    value: ".btn.btn-link"
  "overzichtLinkToonAlleKoppelingen":
    locator: "id"
    value: "houderOverzichtAShowKoppelingen"

# forms
  "overzichtFormKoppelPersoonBsn":
    locator: "id"
    value: "houderOverzichtInputBsnInput"
  "overzichtFormKoppelPersoonGebDatum":
    locator: "id"
    value: "houderOverzichtInputGeboorteDatumInput"

#buttons
  "overzichtButtonKoppelPersoon":
    locator: "css"
    value: ".btn-primary"
  "overzichtButtonOngedaanMakenKoppeling":
    locator: "css"
    value: ".anchor-cancel-add-koppeling"

#datepicker
  "overzichtDatePickerActiveDate":
    locator: 'css'
    value: 'a.ui-state-active'

#breadcrumbs
  "overzichtHouderBreadcrumb1":
    locator: 'id'
    value: 'mainLayoutABreadcrumb0'
  "overzichtHouderBreadcrumb2":
    locator: 'id'
    value: 'mainLayoutABreadcrumb1'
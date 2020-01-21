module.exports = {
  identity: function(v) {
    return v;
  },
  resLink: function(title) {
    return {
      locator: "xpath",
      value: `(//a[contains(., '${title}')])[1]`
    };
  },
  orgName: {
    locator: "xpath",
    value: '//h1'
  },
  myLink: {
    locator: "xpath",
    value: "//a",
    behaviour: {
      get: () => "a value"
    }
  }
};

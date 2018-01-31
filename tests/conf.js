exports.config = {
  // SELENIUM_PROMISE_MANAGER: false,
  directConnect: true,
  specs: ["spec/*"],
  capabilities: {
    browserName: "chrome",
    chromeOptions: {
      args: ["--headless", "--disable-gpu", "--window-size=1024,800"]
    },
    shardTestFiles: false,
    maxInstances: 5
  },
  framework: "jasmine",
  jasmineNodeOpts: {
    silent: true,
    defaultTimeoutInterval: 300000,
    includeStackTrace: false
  },
  baseUrl: "http://google.com",
  onPrepare: function() {
    require("../lib");
    testx.objects.add("tests/objects/objects.csv");
    testx.objects.add(require("./objects"));
    testx.functions.add(require("./functions"));
    testx.keywords.add(require("./keywords"));
    return beforeEach(function() {
      return (browser.ignoreSynchronization = true);
    });
  }
};

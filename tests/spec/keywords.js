describe("Keyword", function() {
  it("check should work", function() {
    testx.run("tests/scripts/check.testx");
  });
  it("that requrie basic navigation should work", function() {
    testx.run("tests/scripts/cookies.testx");
    testx.run("tests/scripts/navigate.testx");
  });
  it("wait should work", function() {
    testx.run("tests/scripts/wait.testx", {
      match: "testxio"
    });
  });
});

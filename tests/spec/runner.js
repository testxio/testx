describe("Runner", function() {
  it("should be able to run a testx file with context", function() {
    testx.run("tests/scripts/sample.testx", {
      match: "testxio"
    });
  });
  it("should be able to run a testx file without context", function() {
    testx.run("tests/scripts/no-context.testx");
  });
  it("should be able to run an in-line yaml script", function() {
    testx.runScript(
      testx.parsers
        .get("testx")
        .parse(
          "- run:\n    file: 'tests/scripts/sample.testx'\n    match: 'testxio'"
        )
    );
  });
});

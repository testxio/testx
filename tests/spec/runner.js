describe("Runner", () => {
  it("should be able to run a testx file with context", () =>
    testx.run("tests/scripts/sample.testx", {
      match: "testxio"
    }));
  it("should be able to run a testx file without context", () =>
    testx.run("tests/scripts/no-context.testx"));
  it("should be able to run an in-line yaml script", () =>
    testx.runScript(
      testx.parsers
        .get("testx")
        .parse(
          `- run:
                script: 'tests/scripts/sample.testx'
                context:
                    match: 'testxio'`
        )
    ));
});

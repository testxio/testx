describe("Keyword", () => {
  it("check should check that objects conform", () =>
    testx.run("tests/scripts/check.testx"));
  it("that requires basic navigation should work", async () => {
    await testx.run("tests/scripts/cookies.testx");
    await testx.run("tests/scripts/navigate.testx");
  });
  it("wait should wait for objects to conform", () =>
    testx.run("tests/scripts/wait.testx", { match: "testxio" }));
  it("run should execute a script", () => testx.run("tests/scripts/run.testx"));
});

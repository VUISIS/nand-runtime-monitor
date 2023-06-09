machine TestSimpleRead {

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool) {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass);
    tokens += (sizeof(tokens), token);
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      addToken(testTokens, c_read_setup, true, true);
      addToken(testTokens, c_dummy, true, true);
      addToken(testTokens, c_dummy, true, true);
      addToken(testTokens, c_dummy, true, true);
      addToken(testTokens, c_dummy, true, true);
      addToken(testTokens, c_dummy, true, true);
      addToken(testTokens, c_dummy, true, true);
      addToken(testTokens, c_read_execute, true, true);

      tester = new NandTester();
      send tester, eRunTest, (tokens=testTokens, sender=this);
      goto RunningTest;
    }
  }

  state RunningTest {
    on eTestSuccessful do {

    }

    on eTestFailed do {
    }
  }
}

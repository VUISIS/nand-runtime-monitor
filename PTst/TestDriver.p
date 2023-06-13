machine TestSimpleRead {

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_execute, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);

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

machine TestReadSkipExecute {

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_dummy, true, false);
      testTokens = addToken(testTokens, c_dummy, true, false);
      testTokens = addToken(testTokens, c_dummy, true, false);
      testTokens = addToken(testTokens, c_read_setup, true, true);

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

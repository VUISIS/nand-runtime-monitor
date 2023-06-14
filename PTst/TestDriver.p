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

machine TestReadNotReady {

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
      testTokens = addToken(testTokens, c_read_execute, false, false);
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

machine TestSimpleProgram {

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

      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_program_execute, true, true);
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

machine TestProgramSkipExecute {

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

      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
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

machine TestProgramWrongExecute {

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

      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_read_execute, true, false);
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

machine TestSimpleErase {

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

      testTokens = addToken(testTokens, c_erase_setup, true, true);
      testTokens = addToken(testTokens, c_erase_setup, true, true);
      testTokens = addToken(testTokens, c_erase_setup, true, true);
      testTokens = addToken(testTokens, c_erase_setup, true, true);
      testTokens = addToken(testTokens, c_erase_execute, true, true);
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

machine TestEraseSkipExecute {

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

      testTokens = addToken(testTokens, c_erase_setup, true, true);
      testTokens = addToken(testTokens, c_erase_setup, true, true);
      testTokens = addToken(testTokens, c_erase_setup, true, true);
      testTokens = addToken(testTokens, c_erase_setup, true, true);
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

machine TestEraseWrongExecute {

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

      testTokens = addToken(testTokens, c_erase_setup, true, true);
      testTokens = addToken(testTokens, c_erase_setup, true, true);
      testTokens = addToken(testTokens, c_erase_setup, true, true);
      testTokens = addToken(testTokens, c_erase_setup, true, true);
      testTokens = addToken(testTokens, c_program_execute, true, false);
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

machine TestLong {

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

    // Do a read
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_execute, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);

    // Do a read with an error
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_execute, false, false);
      testTokens = addToken(testTokens, c_dummy, true, false);
      testTokens = addToken(testTokens, c_dummy, true, false);
      testTokens = addToken(testTokens, c_dummy, true, false);

      // Then move to a good program
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_dummy, true, true);
      testTokens = addToken(testTokens, c_program_execute, true, true);

      // then a bad program
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_program_setup, true, true);
      testTokens = addToken(testTokens, c_dummy, false, false);
      testTokens = addToken(testTokens, c_dummy, false, false);
      testTokens = addToken(testTokens, c_dummy, false, false);

      // and back to a good read
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_setup, true, true);
      testTokens = addToken(testTokens, c_read_execute, true, true);
      testTokens = addToken(testTokens, c_dummy, false, true);
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


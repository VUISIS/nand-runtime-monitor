machine TestSimpleRead {

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_execute, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);

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

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_execute, false, false, r_none);
      testTokens = addToken(testTokens, c_dummy, true, false, r_none);
      testTokens = addToken(testTokens, c_dummy, false, false, r_none);
      testTokens = addToken(testTokens, c_dummy, true, false, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_auto);

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

machine TestReadNoAddress {

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_execute, true, false, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_auto);

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

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, false, r_none);
      testTokens = addToken(testTokens, c_dummy, true, false, r_none);
      testTokens = addToken(testTokens, c_dummy, true, false, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_auto);

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

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_program_execute, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);

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

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);

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

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_read_execute, true, false, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_auto);

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

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_erase_execute, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);

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

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);

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

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_erase_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_execute, true, false, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_auto);

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

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

    // Do a read
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_execute, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);

    // Do a read with an error
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_execute, false, false, r_none);
      testTokens = addToken(testTokens, c_dummy, true, false, r_none);
      testTokens = addToken(testTokens, c_dummy, true, false, r_none);
      testTokens = addToken(testTokens, c_dummy, true, false, r_none);

      // Then move to a good program
      testTokens = addToken(testTokens, c_program_setup, true, true, r_auto);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_program_execute, true, true, r_none);

      // then a bad program
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_program_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, false, false, r_none);
      testTokens = addToken(testTokens, c_dummy, false, false, r_none);
      testTokens = addToken(testTokens, c_dummy, false, false, r_none);

      // and back to a good read
      testTokens = addToken(testTokens, c_read_setup, true, true, r_auto);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_execute, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, false, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_dummy, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);

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

machine TestReset {

  fun addToken(tokens: tTokenList, cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType) : tTokenList {
    var token: tTestToken;

    token = (cmd=cmd, ready=ready, shouldPass=shouldPass, resetType=resetType);
    tokens += (sizeof(tokens), token);

    return tokens;
  }

  start state Init {
    entry {
      var testTokens: tTokenList;
      var tester: machine;

      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_send);
      testTokens = addToken(testTokens, c_read_setup, true, true, r_none);

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


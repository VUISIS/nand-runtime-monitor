enum eResetType {
  r_none,
  r_send,
  r_auto
}

type tTestToken = (cmd: eCommand, ready: bool, shouldPass: bool, resetType: eResetType);

type tTokenList = seq[tTestToken];

type tRunTest = (tokens: tTokenList, sender: machine);

event eRunTest : tRunTest;
event eTestSuccessful;
event eTestFailed;

machine NandTester
{
  var runtimeMonitor : machine;
  var testPos : int;
  var expectedPassed : int;
  var passed : int;
  var currToken : tTestToken;
  var currTest : tTokenList;
  var currSender : machine;
  var expectingToken : bool;
  var currResetType : eResetType;

  start state Init {
    entry {
      runtimeMonitor = new RuntimeMonitor(this);
      goto Run;
    }
  }

  state Run {
    on eRunTest do (runTest: tRunTest) {
      currTest = runTest.tokens;
      testPos = 0;
      expectedPassed = 0;
      passed = 0;
      currSender = runTest.sender;

      goto SendNextToken;
    }
  }

  state SendNextToken {
    entry {
      if (testPos >= sizeof(currTest)) {
        if (expectedPassed != passed) {
          send currSender, eTestFailed;
        } else {
          send currSender, eTestSuccessful;
        }
        goto Run;
      }
      currToken = currTest[testPos];
      currResetType = currToken.resetType;

      if (currToken.resetType == r_send) {
        print ("Sending reset");
        send runtimeMonitor, eReset;
        goto AwaitReset;
      } else {
        expectingToken = currToken.shouldPass;

        print ("Sending token ");
        send runtimeMonitor, eToken, (cmd=currToken.cmd, ready=currToken.ready);

        if (expectingToken) {
          expectedPassed = expectedPassed + 1;
          if (currResetType == r_auto) {
            goto AwaitReset;
          } else {
            goto AwaitToken;
          }
        } else {
          goto ReadyNextToken;
        }
      }
    }

    on eToken do {
      print ("Received unexpected token ");
      send currSender, eTestFailed;
      goto Run;
    }

    on eReset do {
      print ("Received unexpected reset ");
      send currSender, eTestFailed;
      goto Run;
    }
  }

  state ReadyNextToken {
    entry {
      testPos = testPos + 1;
      goto SendNextToken;
    }
  }

  state AwaitToken {
    on eToken do (t: tToken) {
      if (!expectingToken || (t.cmd != currToken.cmd)) {
        print ("Received unexpected token ");
        send currSender, eTestFailed;
        goto Run;
      }
      passed = passed + 1;
      print ("Received token ");
      goto ReadyNextToken;
    }

    on eReset do {
        print ("Received unexpected reset ");
        send currSender, eTestFailed;
        goto Run;
    }
  }

  state AwaitReset {
    on eToken do (t: tToken) {
      print ("Received unexpected token ");
      send currSender, eTestFailed;
      goto Run;
    }

    on eReset do {
      print ("Received expected reset");
      if (currResetType == r_auto) {
        goto AwaitToken;
      } else {
        goto ReadyNextToken;
      }
    }
  }
}

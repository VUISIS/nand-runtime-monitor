type tTestToken = (cmd: eCommand, ready: bool, shouldPass: bool);

type tTokenList = seq[tTestToken];

type tRunTest = (tokens: tTokenList, sender: machine);

event eRunTest : tRunTest;
event eTestSuccessful;
event eTestFailed;

machine NandTester
{
  var runtimeMonitor : machine;
  var testPos : int;
  var currToken : tTestToken;
  var currTest : tTokenList;
  var currSender : machine;

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
      currSender = runTest.sender;

      goto SendNextToken;
    }
  }

  state SendNextToken {
    entry {
      if (testPos >= sizeof(currTest)) {
        send currSender, eTestSuccessful;
        goto Run;
      }
      currToken = currTest[testPos];
      send runtimeMonitor, eToken, (cmd=currToken.cmd, ready=currToken.ready);
      testPos = testPos + 1;

      if (currToken.shouldPass) {
        goto AwaitToken;
      }
    }

    on eToken do {
      send currSender, eTestFailed;
      goto Run;
    }
  }

  state AwaitToken {
    on eToken do (t: tToken) {
      if (t.cmd != currToken.cmd) {
        send currSender, eTestFailed;
        goto Run;
      }
      goto SendNextToken;
    }
  }
}

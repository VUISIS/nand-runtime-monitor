test simpleRead [main=TestSimpleRead]:
  assert TestOK in (union RuntimeMonitorModules, {TestSimpleRead});
test readNoAddress [main=TestReadNoAddress]:
  assert TestOK in (union RuntimeMonitorModules, {TestReadNoAddress});
test readNotReady [main=TestReadNotReady]:
  assert TestOK in (union RuntimeMonitorModules, {TestReadNotReady});
test readSkipExecute [main=TestReadSkipExecute]:
  assert TestOK in (union RuntimeMonitorModules, {TestReadSkipExecute});
test simpleProgram [main=TestSimpleProgram]:
  assert TestOK in (union RuntimeMonitorModules, {TestSimpleProgram});
test programSkipExecute [main=TestProgramSkipExecute]:
  assert TestOK in (union RuntimeMonitorModules, {TestProgramSkipExecute});
test programWrongExecute [main=TestProgramWrongExecute]:
  assert TestOK in (union RuntimeMonitorModules, {TestProgramWrongExecute});
test simpleErase [main=TestSimpleErase]:
  assert TestOK in (union RuntimeMonitorModules, {TestSimpleErase});
test eraseSkipExecute [main=TestEraseSkipExecute]:
  assert TestOK in (union RuntimeMonitorModules, {TestEraseSkipExecute});
test eraseWrongExecute [main=TestEraseWrongExecute]:
  assert TestOK in (union RuntimeMonitorModules, {TestEraseWrongExecute});
test longTest [main=TestLong]:
  assert TestOK in (union RuntimeMonitorModules, {TestLong});
test resetTest [main=TestReset]:
  assert TestOK in (union RuntimeMonitorModules, {TestReset});

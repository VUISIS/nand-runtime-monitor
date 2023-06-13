test simpleRead [main=TestSimpleRead]:
  assert TestOK in (union RuntimeMonitorModules, {TestSimpleRead});
test readSkipExecute [main=TestReadSkipExecute]:
  assert TestOK in (union RuntimeMonitorModules, {TestReadSkipExecute});

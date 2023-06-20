#!/bin/sh
P compile -pp RuntimeMonitor.pproj
if [ $? -ne 0 ]; then
  echo "Test halted for compilation error"
  exit 1
fi

mkdir -p testout
for testname in simpleRead readNoAddress readNotReady readSkipExecute simpleProgram programSkipExecute programWrongExecute simpleErase eraseSkipExecute eraseWrongExecute longTest; do
  P check PGenerated/CSharp/net6.0/RuntimeMonitor.dll -v -tc $testname > testout/$testname".txt"
  if [ $? -ne 0 ]; then
    echo "Test $testname failed"
  else
    echo "Test $testname passed"
  fi
done

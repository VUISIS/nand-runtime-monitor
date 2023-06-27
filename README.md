# Nand Runtime Monitor Code Generator

This project is a combination of a simple Python script to generate a P source
file, and a P project to test the generated file. To run the generator, just
run:

```
python3 cooked_to_nand.py
```

This will generate the PSrc/RuntimeMonitor.p

If you don't have P installed already, make sure you have the Microsoft Dotnet framework installed, and then do:

```
dotnet tool install --global P
```

To compile the P program:

```
P compile -pp RuntimeMonitor.pproj
```

To run a single test, for example "simpleRead", do:

```
P check PGenerated/CSharp/net6.0/RuntimeMonitor.dll -v -tc simpleRead
```

There is a `run_test.sh` script that compiles the P program and then runs
all the tests, printing out whether or not they were successful. All the output
from each test is sent to the testout directory.

MATLAB pointer array example
============================

Minimal example to reproduce a problem interfacing with shared libraries from
MATLAB

This includes a test shared library called mattest.dll which exposes an opaque
struct `mattest_opaque` and functions to create, destroy and access these
structs.

The repo also includes a MATLAB script that tries to interface with these
functions, but shows problems.

Usage
-----

In order to run this test, we need to build the shared library and run the
MATLAB script.

To build the library, the user needs a C++ compiler (VS2017 or more recent),
[CMake](cmake.org) and [conan](conan.io). Open a command prompt in this
repository and type the following commands:

```
mkdir build
cd build
conan install ..
conan build ..
```

To run the MATLAB script, simply open `testscript.m` in MATLAB and execute it.

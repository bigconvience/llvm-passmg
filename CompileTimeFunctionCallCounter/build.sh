#!/usr/bin/env bash

clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared CompileTimeFunctionCallCounter.cpp -o CompileTimeFunctionCallCounter.dylib `llvm-config --ldflags`

clang -S -emit-llvm ./Tests/Test.c -o ./Tests/Test.ll
opt -load-pass-plugin=./CompileTimeFunctionCallCounter.dylib -passes="compile-time-function-call-counter" -disable-output ./Tests/Test.ll

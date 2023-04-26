#!/usr/bin/env bash

clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared DynamicCallCounter.cpp -o DynamicCallCounter.dylib `llvm-config --ldflags`

clang -S -emit-llvm ./Tests/Test.c -o ./Tests/Test.ll
opt -load-pass-plugin=./DynamicCallCounter.dylib -passes="dynamic-cc" ./Tests/Test.ll -o Test.bin
lli ./Test.bin
#!/usr/bin/env bash

clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared SimpleLoopPass.cpp -o SimpleLoopPass.dylib `llvm-config --ldflags`

# clang -S -emit-llvm ./Tests/SimpleLoopTest.c -o ./Tests/SimpleLoopTest.ll
opt -load-pass-plugin=./SimpleLoopPass.dylib -passes="simple-loop-pass" -disable-output ./Tests/SimpleLoopTest.ll

# clang -S -emit-llvm ./Tests/NestedLoopTest.c -o ./Tests/NestedLoopTest.ll
opt -load-pass-plugin=./SimpleLoopPass.dylib -passes="simple-loop-pass" -disable-output ./Tests/NestedLoopTest.ll

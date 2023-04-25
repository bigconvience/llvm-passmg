#!/usr/bin/env bash

clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared SimpleFunctionPass.cpp -o SimpleFunctionPass.dylib `llvm-config --ldflags`

# clang -S -emit-llvm Test.c

opt -load-pass-plugin=./SimpleFunctionPass.dylib -passes="simple-function-pass" -disable-output Test.ll

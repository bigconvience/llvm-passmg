#!/usr/bin/env bash

clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared SimpleModulePass.cpp -o SimpleModulePass.dylib `llvm-config --ldflags`

clang -S -emit-llvm Test.c

opt -load-pass-plugin=./SimpleModulePass.dylib -passes="simple-module-pass" -disable-output Test.ll

#!/usr/bin/env bash

clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared Hello.cpp -o LLVMHello.so `llvm-config --ldflags`

opt -load ./LLVMHello.so -enable-new-pm=0 -hello < test.ll > /dev/null

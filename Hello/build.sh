#!/usr/bin/env bash

clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared Hello.cpp -o LLVMHello.so `llvm-config --ldflags`

echo 'hello--->'
opt -load ./LLVMHello.so -enable-new-pm=0 -hello < Test.ll > /dev/null

echo 'hello2--->'
opt -load ./LLVMHello.so -enable-new-pm=0 -hello2 < Test.ll > /dev/null

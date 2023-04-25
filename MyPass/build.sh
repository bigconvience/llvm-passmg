#!/usr/bin/env bash

clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared MyPass.cpp -o MyPass.dylib `llvm-config --ldflags`

opt -load-pass-plugin=./MyPass.dylib -passes="my-pass" -disable-output Test.ll

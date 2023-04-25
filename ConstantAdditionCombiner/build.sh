#!/usr/bin/env bash

clang `llvm-config --cxxflags` -Wl,-znodelete -fno-rtti -fPIC -shared ConstantAdditionCombiner.cpp -o ConstantAdditionCombiner.dylib `llvm-config --ldflags`

echo 'Find the constant addition instructions'
opt -load-pass-plugin=./ConstantAdditionCombiner.dylib -passes="constant-addition-printer" -disable-output ./Test.ll


echo -e '\nCombine the constant addition instructions'
opt -load-pass-plugin=./ConstantAdditionCombiner.dylib -passes="constant-addition-combiner" -S ./Test.ll

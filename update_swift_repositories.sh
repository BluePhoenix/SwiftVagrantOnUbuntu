#!/bin/bash
# TODO: Modify this script to run on the VM, currently should be run on the host

RepositoriesFolder=$(pwd)"/repositories"

mkdir -p $RepositoriesFolder

if cd "$RepositoriesFolder/swift"; then git pull; else git clone https://github.com/apple/swift.git "$RepositoriesFolder/swift"; fi
if cd "$RepositoriesFolder/llvm"; then git pull; else git clone https://github.com/apple/swift-llvm.git "$RepositoriesFolder/llvm"; fi
if cd "$RepositoriesFolder/clang"; then git pull; else git clone https://github.com/apple/swift-clang.git "$RepositoriesFolder/clang"; fi
if cd "$RepositoriesFolder/lldb"; then git pull; else git clone https://github.com/apple/swift-lldb.git "$RepositoriesFolder/lldb"; fi
if cd "$RepositoriesFolder/cmark"; then git pull; else git clone https://github.com/apple/swift-cmark.git "$RepositoriesFolder/cmark"; fi
if cd "$RepositoriesFolder/llbuild"; then git pull; else git clone https://github.com/apple/swift-llbuild.git "$RepositoriesFolder/llbuild"; fi
if cd "$RepositoriesFolder/swiftpm"; then git pull; else git clone https://github.com/apple/swift-package-manager.git "$RepositoriesFolder/swiftpm"; fi
if cd "$RepositoriesFolder/swift-corelibs-xctest"; then git pull; else git clone https://github.com/apple/swift-corelibs-xctest.git "$RepositoriesFolder/swift-corelibs-xctest"; fi
if cd "$RepositoriesFolder/swift-corelibs-foundation"; then git pull; else git clone https://github.com/apple/swift-corelibs-foundation.git "$RepositoriesFolder/swift-corelibs-foundation"; fi

if cd "$RepositoriesFolder/ninja"; then git pull; else git clone git@github.com:martine/ninja.git "$RepositoriesFolder/ninja"; fi

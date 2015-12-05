#!/bin/bash
# This script is designed to be run on the VM

RepositoriesFolder="/vagrant/repositories"

mkdir -p $RepositoriesFolder

if cd "$RepositoriesFolder/Perfect"; then git pull; else git clone https://github.com/PerfectlySoft/Perfect.git "$RepositoriesFolder/Perfect"; fi

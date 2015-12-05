#!/bin/bash
# set -x

# Set variables for current Swift snapshot
Snapshot=swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz
SnapshotURL="https://swift.org/builds/ubuntu1404/swift-2.2-SNAPSHOT-2015-12-01-b/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz"
SnapshotLocation=/vagrant/snapshots
SwiftExtractionLocation=$SnapshotLocation/swift

# Download Swift snapshot if it does not exist
if ! [ -f $SnapshotLocation/$Snapshot ]; then
	mkdir -p $SnapshotLocation/
	cd $SnapshotLocation/
	echo "$SnapshotLocation/$Snapshot missing, will download now."
	curl -o $SnapshotLocation/$Snapshot $SnapshotURL
else
	echo "$SnapshotLocation/$Snapshot already exists."
fi

# Extract Swift snapshot if it has not been extracted
if ! [ -d $SwiftExtractionLocation ]; then
	mkdir -p $SwiftExtractionLocation/
	echo "$SwiftExtractionLocation missing, extracting to it now."
	tar -zxvf /vagrant/snapshots/$Snapshot -C $SwiftExtractionLocation --strip-components=1  
	echo "$SwiftExtractionLocation extraction complete."
else
	echo "$SwiftExtractionLocation already exists."
fi

# Copy over Swift files
echo "Copying from $SwiftExtractionLocation to system."
cp -r $SwiftExtractionLocation/* /

# Attempt to update apt-get
sudo apt-get update
sudo apt-get upgrade

# Required dependencies listed at https://github.com/apple/swift
sudo apt-get --assume-yes install git clang

# These are optional, but needed if you want to build Swift yourself
# sudo apt-get --assume-yes install git cmake ninja-build clang uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config
# sudo apt-get --assume-yes install clang-3.6
# sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100
# sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100

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

sudo apt-get --assume-yes install clang

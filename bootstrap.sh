#!/bin/bash

Snapshot=swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz

mkdir -p /vagrant/snapshots/
cd /vagrant/snapshots/

# Download Swift snapshot if it does not exist
if ! [ -f /vagrant/snapshots/$Snapshot ]; then
  curl -o /vagrant/snapshots/$Snapshot "https://swift.org/builds/ubuntu1404/swift-2.2-SNAPSHOT-2015-12-01-b/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz"
fi

# curl -O https://swift.org/builds/ubuntu1404/swift-2.2-SNAPSHOT-2015-12-01-b/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz
# cp /vagrant/snapshots/$Snapshot /tmp/swift.tar.gz
mkdir -p ~/.swift
tar -zxvf /vagrant/snapshots/$Snapshot -C ~/.swift --strip-components=1
PATH=~/.swift/usr/bin:$PATH

sudo apt-get --assume-yes install clang

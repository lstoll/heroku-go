#!/bin/bash
# Install compiler. Lazy idempotence
if [ ! -f /usr/local/bin/6g ]; then
    sudo apt-get -y install bison ed gawk gcc libc6-dev make python-setuptools python-dev build-essential gcc
    sudo easy_install mercurial
    # Google GO bug - ignore the fact that we can lookup localhost as IPv6
    cat /etc/hosts | grep -v "::" > /tmp/hosts
    sudo mv /tmp/hosts /etc/hosts
    cd /usr/local
    sudo hg clone -u release https://go.googlecode.com/hg/ go
    cd go/src
    sudo bash -c 'export GOBIN=/usr/local/bin ; ./all.bash'
fi
# Make our app in to dist
cd /vagrant
make

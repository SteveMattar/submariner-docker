#!/bin/bash

GOPATH="${GOPATH:-$HOME/go}"

docker build -f Dockerfile.submariner -t quay.io/smattar/submariner:0.4.0-rc2 $GOPATH/src/github.com/submariner-io/submariner
docker build -f Dockerfile.route-agent -t quay.io/smattar/submariner-route-agent:0.4.0-rc2 $GOPATH/src/github.com/submariner-io/submariner
docker build -f Dockerfile.globalnet -t quay.io/smattar/submariner-globalnet:0.4.0-rc2 $GOPATH/src/github.com/submariner-io/submariner
docker build -f Dockerfile.lighthouse-agent -t quay.io/smattar/lighthouse-agent:0.4.0-rc2 $GOPATH/src/github.com/submariner-io/lighthouse
docker build -f Dockerfile.lighthouse-coredns -t quay.io/smattar/lighthouse-coredns:0.4.0-rc2 --build-arg REMOTE_SOURCE=. --build-arg REMOTE_SOURCE_DIR=remote-source $GOPATH/src/github.com/submariner-io/coredns
docker build -f Dockerfile.submariner-operator -t quay.io/smattar/submariner-operator:0.4.0-rc2 $GOPATH/src/github.com/submariner-io/submariner-operator
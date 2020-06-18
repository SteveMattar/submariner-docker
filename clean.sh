#!/bin/bash

GOPATH="${GOPATH:-$HOME/go}"

cd $GOPATH/src/github.com/submariner-io/submariner && \
make cleanup

docker system prune --all
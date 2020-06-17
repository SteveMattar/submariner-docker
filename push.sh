#!/bin/bash
REPO="quay.io/smattar"

docker push $REPO/submariner:0.4.0-rc2
docker push $REPO/submariner-route-agent:0.4.0-rc2
docker push $REPO/submariner-globalnet:0.4.0-rc2
docker push $REPO/lighthouse-agent:0.4.0-rc2
docker push $REPO/lighthouse-coredns:0.4.0-rc2
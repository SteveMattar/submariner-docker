#!/bin/bash

GOPATH="${GOPATH:-$HOME/go}"
REPO="quay.io/smattar"
#TAG="0.4.0-rc2"
TAG="v0.4-2"

cd $GOPATH/src/github.com/submariner-io/submariner && \
make clusters && \
cd `dirname $0` && \
subctl deploy-broker --kubeconfig $GOPATH/src/github.com/submariner-io/submariner/output/kubeconfigs/kind-config-cluster1 --service-discovery --globalnet && \
subctl join --kubeconfig $GOPATH/src/github.com/submariner-io/submariner/output/kubeconfigs/kind-config-cluster2 broker-info.subm --clusterid cluster2 --disable-nat --cable-driver libreswan --repository $REPO --version $TAG --globalnet-cidr 169.254.1.0/24 && \
subctl join --kubeconfig $GOPATH/src/github.com/submariner-io/submariner/output/kubeconfigs/kind-config-cluster3 broker-info.subm --clusterid cluster3 --disable-nat --cable-driver libreswan --repository $REPO --version $TAG --globalnet-cidr 169.254.2.0/24 && \
sleep 30 && \
subctl verify --verbose $GOPATH/src/github.com/submariner-io/submariner/output/kubeconfigs/kind-config-cluster2 $GOPATH/src/github.com/submariner-io/submariner/output/kubeconfigs/kind-config-cluster3 && \
xunit-viewer -r junit_subctl_01.xml -o index.html && \
exit $?
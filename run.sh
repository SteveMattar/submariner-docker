#!/bin/bash

GOPATH="${GOPATH:-~/go}"

cd $GOPATH/src/github.com/submariner-io/submariner && \
make clusters && \
subctl deploy-broker --kubeconfig output/kubeconfigs/kind-config-cluster1 --service-discovery --globalnet && \
subctl join --kubeconfig output/kubeconfigs/kind-config-cluster2 broker-info.subm --clusterid cluster2 --disable-nat --cable-driver libreswan --operator-image quay.io/smattar/submariner-operator:0.4.0-rc2 --repository quay.io/smattar --version 0.4.0-rc2 && \
subctl join --kubeconfig output/kubeconfigs/kind-config-cluster3 broker-info.subm --clusterid cluster3 --disable-nat --cable-driver libreswan --operator-image quay.io/smattar/submariner-operator:0.4.0-rc2 --repository quay.io/smattar --version 0.4.0-rc2 && \
#subctl verify-connectivity --verbose output/kubeconfigs/kind-config-cluster2 output/kubeconfigs/kind-config-cluster3 && \
exit $?
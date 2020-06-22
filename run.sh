#!/bin/bash

GOPATH="${GOPATH:-$HOME/go}"

cd $GOPATH/src/github.com/submariner-io/submariner && \
make clusters && \
cd `dirname $0` && \
subctl deploy-broker --kubeconfig output/kubeconfigs/kind-config-cluster1 --service-discovery --globalnet && \
subctl join --kubeconfig output/kubeconfigs/kind-config-cluster2 broker-info.subm --clusterid cluster2 --disable-nat --cable-driver libreswan --operator-image quay.io/smattar/submariner-operator:0.4.0-rc2 --repository quay.io/smattar --version 0.4.0-rc2 --globalnet-cidr 169.254.1.0/24 && \
subctl join --kubeconfig output/kubeconfigs/kind-config-cluster3 broker-info.subm --clusterid cluster3 --disable-nat --cable-driver libreswan --operator-image quay.io/smattar/submariner-operator:0.4.0-rc2 --repository quay.io/smattar --version 0.4.0-rc2 --globalnet-cidr 169.254.2.0/24 && \
subctl verify-connectivity --verbose output/kubeconfigs/kind-config-cluster2 output/kubeconfigs/kind-config-cluster3 && \
xunit-viewer -r junit_subctl_01.xml -o index.html && \
exit $?
# README

## Prerequisites

### Clone the following git repositories

```bash
git clone https://github.com/submariner-io/submariner.git $GOPATH/src/github.com/submariner-io
git clone https://github.com/submariner-io/lighthouse.git  $GOPATH/src/github.com/submariner-io
git clone https://github.com/submariner-io/submariner-operator.git  $GOPATH/src/github.com/submariner-io
```

### install sysctl

```bash
curl -Ls https://raw.githubusercontent.com/submariner-io/submariner-operator/master/scripts/subctl/getsubctl.sh | bash
export PATH=$PATH:~/.local/bin
echo export PATH=\$PATH:~/.local/bin >> ~/.profile
```

### install xunit-viewer

```bash
npm i -g xunit-viewer
```

## Instructions

```bash
build.sh
push.sh
run.sh
clean.sh
```

## Xunit Viewer

[report](https://stevemattar.github.io/submariner-docker/)

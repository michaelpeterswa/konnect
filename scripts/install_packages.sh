#!/bin/bash

dnf install -y $(cat /scripts/pkglist.txt)

unamestr=$(uname -m)

# Install evans
if [ "$unamestr" = "x86_64" ]; then
    curl -sSLO https://github.com/ktr0731/evans/releases/download/v0.10.11/evans_linux_amd64.tar.gz
    tar -xvzf evans_linux_amd64.tar.gz
    mv evans /usr/local/bin
    rm -rf evans_linux_amd64.tar.gz
elif [ "$unamestr" = "aarch64" ] || [ $unamestr = "arm64" ]; then
    curl -sSLO https://github.com/ktr0731/evans/releases/download/v0.10.11/evans_linux_arm64.tar.gz
    tar -xvzf evans_linux_arm64.tar.gz
    mv evans /usr/local/bin
    rm -rf evans_linux_arm64.tar.gz
fi

# Install yq
if [ "$unamestr" = "x86_64" ]; then
    curl -sSLO https://github.com/mikefarah/yq/releases/download/v4.44.1/yq_linux_amd64.tar.gz
    tar -xvzf yq_linux_amd64.tar.gz
    mv yq_linux_amd64 /usr/local/bin/yq
    rm -rf yq_linux_amd64.tar.gz yq.1 install-man-page.sh
elif [ "$unamestr" = "aarch64" ] || [ $unamestr = "arm64" ]; then
    curl -sSLO https://github.com/mikefarah/yq/releases/download/v4.44.1/yq_linux_arm64.tar.gz
    tar -xvzf yq_linux_arm64.tar.gz
    mv yq_linux_arm64 /usr/local/bin/yq
    rm -rf yq_linux_arm64.tar.gz yq.1 install-man-page.sh
fi
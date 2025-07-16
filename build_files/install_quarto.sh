#!/bin/bash
set -ouex pipefail
if [ -x "$(command -v quarto)" ]; then
	true
    else
ARCH="amd64"
QUARTO_DL_URL=$(wget -qO- https://quarto.org/docs/download/_download.json | grep -oP "(?<=\"download_url\":\s\")https.*linux-${ARCH}\.tar.gz")
wget $QUARTO_DL_URL -O /tmp/quarto.tar.gz
tar -C /etc -xvzf /tmp/quarto.tar.gz
EXECUTABLE_PATH=$(find /etc -type d -maxdepth 1 -name "quarto-*")
echo $EXECUTABLE_PATH
ln -s $EXECUTABLE_PATH/bin/quarto /usr/bin/quarto
fi

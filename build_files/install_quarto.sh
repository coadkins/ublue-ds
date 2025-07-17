#!/bin/bash
set -ouex pipefail
# skip install if rstudio/positron quarto is present
if [ -x "$(command -v quarto)" ]; then
	true
    else

# get download url
ARCH="amd64"
QUARTO_DL_URL=$(wget -qO- https://quarto.org/docs/download/_download.json | grep -oP "(?<=\"download_url\":\s\")https.*linux-${ARCH}\.tar.gz")

# download and install
wget $QUARTO_DL_URL -O /tmp/quarto.tar.gz
tar -C /var/usrlocal -xvzf /tmp/quarto.tar.gz

# create symlink
EXECUTABLE_PATH=$(find /usr -type d -maxdepth 1 -name "quarto-*")
ln -s $EXECUTABLE_PATH/bin/quarto /usr/bin/quarto

# clean up
rm -r /tmp/quarto.tar.gz
fi

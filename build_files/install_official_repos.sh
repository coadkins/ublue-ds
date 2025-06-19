#!/bin/bash

set -ouex pipefail

echo "installing packages from official fedora repos"
dnf5 install -y \
	neovim 

echo "installing vscodium"
dnf5 install --enable-repo=download.vscodium.com -y codium

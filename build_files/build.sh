#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# fedora official packages
dnf5 install -y R

# copr packages 

dnf5 -y copr enable iucar/rstudio
dnf5 -y copr enable iucar/duckdb
dnf5 -y install rstudio-desktop
dnf5 -y install duckdb

#### Example for enabling a System Unit File

systemctl enable podman.socket

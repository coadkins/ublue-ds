#!/bin/bash

set -ouex pipefail

log() {
  echo "=== $* ==="
}

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# RPM packages list
declare -A RPM_PACKAGES=(
  ["fedora"]="\
    neovim \
    r"

  ["copr:iucar/rstudio"]="rstudio-desktop"

  ["copr:iucar/duckdb"]="duckdb"
  ["copr:ublue-os/packages"]="ublue-brew"
)
# adapted from astrovm/amyos install-apps.sh
log "Installing RPM packages"

mkdir -p /var/opt
for repo in "${!RPM_PACKAGES[@]}"; do
  read -ra pkg_array <<<"${RPM_PACKAGES[$repo]}"
  if [[ $repo == copr:* ]]; then
    # Handle COPR packages
    copr_repo=${repo#copr:}
    dnf5 -y copr enable "$copr_repo"
    dnf5 -y install "${pkg_array[@]}"
    dnf5 -y copr disable "$copr_repo"
  else
    # Handle regular packages
    [[ $repo != "fedora" ]] && enable_opt="--enable-repo=$repo" || enable_opt=""
    cmd=(dnf5 -y install)
    [[ -n "$enable_opt" ]] && cmd+=("$enable_opt")
    cmd+=("${pkg_array[@]}")
    "${cmd[@]}"
  fi
done

#### Example for enabling a System Unit File

systemctl enable podman.socket

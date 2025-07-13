# Install  Homebrews
  ds-install-brews:
  #!/usr/bin/env bash
  set -euo pipefail

  echo "Installing Homebrews..."
  xargs -a <(curl --retry 3 -sL https://raw.githubusercontent.com/coadkins/ublue-ds/main/repo_files/brews) brew install
  echo "Homebrews installation complete."

# Install R
ds-install-r:
#!/usr/bin/env bash
set -euo pipefail

echo "Installing R ${R_VERSION}..."
git clone https://github.com/rstudio/R-builds ~/git/R-builds
cd ~/git/R-builds
export PLATFORM=fedora-42
export R_INSTALL_PATH=~/R/R_${R_VERSION}
make build-r-$PLATFORM
cd builder/integration/tmp/$PLATFORM
rpm install r-${R_VERSION}_amd64.rpm
echo "R ${R_VERSION} installed!"







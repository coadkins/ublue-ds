# Install  Homebrews
  ds-install-brews:
  #!/usr/bin/env bash
  set -euo pipefail

  echo "Installing Homebrews..."
  xargs -a <(curl --retry 3 -sL https://raw.githubusercontent.com/coadkins/ublue-ds/main/repo_files/brews) brew install
  echo "Homebrews installation complete."






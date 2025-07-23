# Install  Homebrews
  ds-install-brews:
  #!/usr/bin/env bash
  set -eoux pipefail
  echo "Installing Homebrews..."
  xargs -a <(curl --retry 3 -sL https://raw.githubusercontent.com/coadkins/ublue-ds/main/repo_files/brews) brew install
  echo "Homebrews installation complete."

# Install Flatpaks
  ds-install-flatpaks:
  #!/usr/bin/env bash
  set -eoux pipefail
  echo "Installing Flatpaks..."
  xargs -a <(curl --retry 3 -sL https://raw.githubusercontent.com/coadkins/ublue-ds/main/repo_files/flatpaks) flatpak --system -y install
  echo "Flatpaks installation complete."





#!/bin/bash
POSITRON_V=2025.07.0-112
LINUX_ARCH=x64

POSITRON_URL="https://cdn.posit.co/positron/dailies/rpm/x86_64/Positron-${POSITRON_V}-${LINUX_ARCH}.rpm"

wget "$POSITRON_URL" -O positron.rpm
dnf5 -y install positron.rpm
rm positron.rpm

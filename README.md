
# WIP
This repository is a work in progress, and is currently intended primarily for my personal use. 

# Purpose
This repository provides an atomic Fedora desktop that works "out-of-the-box" for data science. It is based on [Universal Blue's](https://universal-blue.org/)  lightly modified versions of [Fedora Kinoite](https://fedoraproject.org/atomic-desktops/kinoite/) and [Fedora Silverblue](https://fedoraproject.org/atomic-desktops/silverblue/) and includes always up-to-date installations of tools that I commonly use in data science workflows, including:

- DuckDB
- Positron
- Quarto
- R (the 2 most recent releases)
- RStudio
- VSCodium

By using [bootc](https://github.com/bootc-dev/bootc), we can avoid the pain of using `rpm-ostree` to install these applications system-wide, which often requires manually downloading an .rpm file, installing it, and rebooting the machine. We also gain all the normal benefits of immutable Linux systems, like reliability and security.

# Installation
The most straightforward way to use this image is to rebase to it from an existing installation of a [Fedora Atomic desktop](https://fedoraproject.org/atomic-desktops/). Those desktop images come with GUI installers that set up the system and users. After installation, install the KDE version with:

```console
bootc switch "ghcr.io/coadkins/ublue-ds-kinoite-main:latest"
```
or the GNOME version with: 
```console
bootc switch "ghcr.io/coadkins/ublue-ds-silverblue-main:latest"
```
# Usage

Although, Fedora recommends the use of toolbx for development on atomic distributions, you can develop simpler projects using the system-wide installations of R and Python with `renv` and `venv`, respectively. The two most recent versions are R are uncoventionally installed under `/usr/bin/R/${R_VERSION}`; this is so that they [continue to update after the initial installation](https://developers.redhat.com/articles/2025/02/26/best-practices-building-bootable-containers#) and can be discovered by Positron without additional configuration.

For projects with more complex dependencies, I use a [distrobox image with rig and uv pre-installed](https://github.com/coadkins/ds-distrobox). That distrobox is pre-configured as an SSH host, and can be accessed with [Positron's Remotes](https://positron.posit.co/remote-ssh.html) extension. 

# Homebrew
Wherever possible, this desktop uses [homebrew](https://brew.sh/) to manage packages and cli tools. You can install common data science tools using the custom just commands:

```console
ujust ds-install-brews 
```
Currently, this installs TeX Live, Typst and uv.

# Acknowledgements

This image was built on the [Universal Blue Image Template](https://github.com/ublue-os/image-template). Some of the installation scripts are modified versions of the scripts developed for the [Rocker project](https://github.com/rocker-org/rocker-versioned2), [rig](https://github.com/r-lib/rig/tree/main) and [AmyOS](https://github.com/astrovm/amyos).

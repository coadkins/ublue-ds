
# WIP
This repository is a work in progress, and is currently intended primarily for my personal use. 

# Purpose
This repository provides an atomic Fedora desktop that works "out-of-the-box" for data science. It is based on a lightly modified version of [Fedora Kinoite](https://fedoraproject.org/atomic-desktops/kinoite/) and includes always up-to-date installations of tools that I commonly use in data science workflows, including:

- DuckDB
- Positron
- Quarto
- RStudio
- VSCodium

By using [bootc](https://github.com/bootc-dev/bootc), we can avoid the pain of using `rpm-ostree` to install these applications system-wide, which often requires manually downloading an .rpm file, installing it, and rebooting the machine. We also gain all the normal benefits of immutable Linux systems, like reliability and security.

Currently some advanced configruation options like CUDA support, etc. are missing, although they may be added in the future.

# Installation
The most straightforward way to use this image is to rebase to it from an existing installation of a [Fedora Atomic desktop](https://fedoraproject.org/atomic-desktops/). Those desktop images come with GUI installers that set up the system and users. After installation, use:

```console
bootc switch "ghcr.io/coadkins/ublue-ds:latest"
```
It is also possible to install this image using [ignition](https://docs.fedoraproject.org/en-US/fedora-coreos/producing-ign/) during the initial boot of a Fedora Atomic system, although this process is more involved.

# Homebrew
Wherever possible, this desktop uses [homebrew](https://brew.sh/) to manage packages and cli tools. You can install common data science tools using the custom just command:

```console
ujust ds-install-brews 
```
Currently, this installs TeX live, Typst and uv.

# Acknowledgements

This image was built on the [Universal Blue Image Template](https://github.com/ublue-os/image-template). Some of the installation scripts are modified versions of the scripts developed for the [Rocker project](https://github.com/rocker-org/rocker-versioned2) and [AmyOS](https://github.com/astrovm/amyos).

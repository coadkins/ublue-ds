
# WIP
This repository is a work in progress, primarly intended for my personal use.

# Purpose
This repository provides a lightly modified version of Fedora Kinoite that includes up-to-date installations of tools that I commonly use in data science workflows, including:

- DuckDB
- Positron
- Quarto
- R (the most recent 4 releases)
- RStudio
- VSCodium

These applications are often not available in the standard Fedora repositories, and can be frustrating to manually download and reinstall using `rpm-ostree`. 

This image was built on the [Universal Blue Image Template](https://github.com/ublue-os/image-template). Some of the installation scripts are modified versions of the scripts developed for the [Rocker project](https://github.com/rocker-org/rocker-versioned2).

Currently some advanced configruation options like CUDA support, etc. are missing, although they may be added in the future.

Finally, an experimental image using the Cosmic Desktop environment is available as `ublue-ds-cosmic-atomic:latest`.

# Installation
The most straightforward way to use this image is to rebase to it from an existing installation of a [Fedora Atomic desktop](https://fedoraproject.org/atomic-desktops/). Those desktops come with GUI installers that set up the system and users. After installation, use:

```console
bootc switch "ghcr.io/coadkins/ublue-ds-kinoite:latest"
```
It is also possible to install this image using [ignition](https://docs.fedoraproject.org/en-US/fedora-coreos/producing-ign/) during the initial boot of a Fedora Atomic system, although this process is more involved.

# Homebrew
Wherever possible, this desktop uses [homebrew](https://brew.sh/) to manage packages and cli tools. You can install common data science tools using the custom just commands:

```console
ujust ds-install-brews 
```
Currently, this installs TeX Live, Typst and uv.

# Usage

Although, Fedora recommends the use of toolbx for development on atomic distributions, you can develop smaller projects using the system-wide installations of R and Python with renv and venv, respectively.

For larger projects, I use a distrobox image with rig and uv pre-installed. 

# Acknowledgements

This image was built on the [Universal Blue Image Template](https://github.com/ublue-os/image-template). Some of the installation scripts are modified versions of the scripts developed for the [Rocker project](https://github.com/rocker-org/rocker-versioned2), [rig](https://github.com/r-lib/rig/tree/main) and [AmyOS](https://github.com/astrovm/amyos).

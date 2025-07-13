
# WIP
This repository is a work in progress, primarly intended for my personal use.

# Purpose
This repository provides a lightly modified version of Fedora Kinoite that includes up-to-date installations of tools that I commonly use in data science workflows, including:

- DuckDB
- Positron
- Quarto
- RStudio
- VSCodium

These applications are often not available in the standard Fedora repositories, and can be frustrating to manually download and reinstall using `rpm-ostree`. 

This image was built on the [Universal Blue Image Template](https://github.com/ublue-os/image-template). Some of the installation scripts are modified versions of the scripts developed for the [Rocker project](https://github.com/rocker-org/rocker-versioned2).

Currently some advanced configruation options like CUDA support, etc. are missing, although they may be added in the future.

# Installation
The most straightforward way to use this image is to rebase to it from an existing installation of a [Fedora Atomic desktop](https://fedoraproject.org/atomic-desktops/). Those desktops come with GUI installers that set up the system and users. After installation, use:

```console
bootc switch "ghcr.io/coadkins/ublue-ds:latest"
```
It is also possible to install this image using [ignition](https://docs.fedoraproject.org/en-US/fedora-coreos/producing-ign/) during the initial boot of a Fedora Atomic system, although this process is more involved.

# Homebrew
Wherever possible, this desktop uses homebrew to manage packages and cli tools. You can install common data science cli tools using:

```console
ujust ds-install-brews 
```
Currently, this installs Texlive, Typst and UV.

# Multiple R Versions

```console
R_VERSION=4.4.3
ujust ds-install-r
```

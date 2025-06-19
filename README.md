
# WIP
This repository is a work in progress, primarly intended for my personal use.

# Purpose
This repository provides a lightly modified version of Fedora Kinoite that provides up-to-date installations of tools that I commonly use in data science workflows, including:

- DuckDB
- Rstudio
- Positron
- Quarto
- VSCodium

This image was built on the [Universal Blue Image Template](https://github.com/ublue-os/image-template)

# Homebrew
Wherever possible, this desktop uses homebrew to manage packages and cli tools. You can install common data science cli tools using:

```console
ujust install-brews 
```

Currently, this installs R, Texlive and UV.

# Installation
To rebase to this image from an existing installation of a Fedora Atomic distribution use:

```console
bootc switch "ghcr.io/coadkins/ublue-ds:latest"
```

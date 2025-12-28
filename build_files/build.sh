#!/usr/bin/env bash
set -euo pipefail

# Example: tailscale repo (from your generated Containerfile)
cp /ctx/tailscale.repo /etc/yum.repos.d/tailscale.repo

# Enable COPR repo for starship
dnf5 copr enable -y atim/starship

# Packages: what the dnf module used to do
dnf5 install -y \
  vim \
  btop \
  rpmconf \
  qemu-guest-agent \
  cockpit-podman \
  cockpit-ostree \
  cockpit-selinux \
  cockpit-storaged \
  tailscale \
  atuin \
  starship \
  zoxide \

dnf5 remove -y nano
dnf5 clean all

# Systemd: what the systemd module used to do
systemctl disable zincati.service || true


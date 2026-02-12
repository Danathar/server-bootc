#!/usr/bin/env bash
set -euo pipefail

# Example: tailscale repo (from your generated Containerfile)
cp /ctx/tailscale.repo /etc/yum.repos.d/tailscale.repo

# Install dnf5 COPR plugin first
dnf5 install -y dnf5-command\(copr\)

# Enable COPR repo for starship
dnf5 copr enable -y atim/starship

# Packages: what the dnf module used to do
dnf5 install -y \
  nodejs \
  npm \
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
  zsh \
  tree \

dnf5 remove -y nano
dnf5 clean all

# Install Codex globally at build-time and always track latest
npm install -g --prefix /usr @openai/codex@latest
npm cache clean --force

# Systemd: what the systemd module used to do
systemctl disable zincati.service || true

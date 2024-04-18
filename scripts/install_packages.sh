#!/bin/bash

# Install packages from pkglist.txt
pacman -S --needed --noconfirm - < scripts/pkglist.txt

# Yay temporary build directory and user creation
mkdir -p /tmp/yay-build
useradd -m -G wheel builder && passwd -d builder
chown -R builder:builder /tmp/yay-build
echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Install yay
su - builder -c "git clone https://aur.archlinux.org/yay.git /tmp/yay-build/yay"
su - builder -c "cd /tmp/yay-build/yay && makepkg -si --noconfirm"

# Remove yay temporary build directory
# rm -rf /tmp/yay-build

# Add non-root user captain
# useradd -m -G wheel captain && passwd -d captain

# Install packages from aurlist.txt
yay -S --noconfirm - < /scripts/aurlist.txt

# Install evans
unamestr=$(uname -m)
if [ "$unamestr" = "x86_64" ]; then
    curl -sSLO https://github.com/ktr0731/evans/releases/download/v0.10.11/evans_linux_amd64.tar.gz
    tar -xvzf evans_linux_amd64.tar.gz
    mv evans /usr/local/bin
    rm -rf evans_linux_amd64.tar.gz
elif [ "$unamestr" = "aarch64" ] || [ $unamestr = "arm64" ]; then
    curl -sSLO https://github.com/ktr0731/evans/releases/download/v0.10.11/evans_linux_arm64.tar.gz
    tar -xvzf evans_linux_arm64.tar.gz
    mv evans /usr/local/bin
    rm -rf evans_linux_arm64.tar.gz
fi
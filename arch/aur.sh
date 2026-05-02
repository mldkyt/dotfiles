#!/bin/bash

sudo pacman -Sy --noconfirm git base-devel rust

sudo sed -i 's/-march=x86-64 -mtune=generic/-march=native -mtune=native/g' /etc/makepkg.conf
sudo sed -i 's/CXXFLAGS="/CXXFLAGS="-march=native -mtune=native /g' /etc/makepkg.conf
sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$(nproc)\"/g" /etc/makepkg.conf

if ! command -v paru >/dev/null 2>&1
then
    git clone https://aur.archlinux.org/paru.git
    pushd paru
    makepkg -si --noconfirm
    popd
fi

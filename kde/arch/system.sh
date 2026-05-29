#!/bin/bash

# KDE
paru -Sy catppuccin-plasma-colorscheme-mocha catppuccin-gtk-theme-mocha catppuccin-cursors-mocha kio-admin dolphin-plugins kde-inotify-survey kde-pim kcolorchooser kdialog kcalc kolourpaint okular plasma-systemmonitor filelight spectacle krita kolourpaint kwallet kwalletmanager --needed --noconfirm

# Printing
paru -Sy cups cups-pdf print-manager system-config-printer epson-inkjet-printer-escpr{,2} --needed --noconfirm

sudo localectl set-locale LANG=en_US.UTF-8 &
sudo localectl set-locale LANGUAGE=en_US.UTF-8 &
sudo localectl set-locale LC_ADDRESS=cs_CZ.UTF-8 &
sudo localectl set-locale LC_COLLATE=cs_CZ.UTF-8 &
sudo localectl set-locale LC_CTYPE=cs_CZ.UTF-8 &
sudo localectl set-locale LC_IDENTIFICATION=cs_CZ.UTF-8 &
sudo localectl set-locale LC_MEASUREMENT=cs_CZ.UTF-8 &
sudo localectl set-locale LC_MESSAGES=cs_CZ.UTF-8 &
sudo localectl set-locale LC_MONETARY=cs_CZ.UTF-8 &
sudo localectl set-locale LC_NAME=cs_CZ.UTF-8 &
sudo localectl set-locale LC_NUMERIC=cs_CZ.UTF-8 &
sudo localectl set-locale LC_PAPER=cs_CZ.UTF-8 &
sudo localectl set-locale LC_TELEPHONE=cs_CZ.UTF-8 &
sudo localectl set-locale LC_TIME=cs_CZ.UTF-8 &

wait

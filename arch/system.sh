#!/bin/bash

# KDE
paru -Sy catppuccin-plasma-colorscheme-mocha catppuccin-gtk-theme-mocha kio-admin dolphin-plugins kde-inotify-survey kde-pim --needed --noconfirm

# Printing
paru -Sy cups cups-pdf print-manager system-config-printer epson-inkjet-printer-escpr{,2} --needed --noconfirm

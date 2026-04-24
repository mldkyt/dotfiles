#!/bin/bash

# KDE
paru -Sy catppuccin-plasma-colorscheme-mocha catppuccin-gtk-theme-mocha catppuccin-cursors-mocha kio-admin dolphin-plugins kde-inotify-survey kde-pim kcolorchooser kdialog kcalc kolourpaint okular plasma-systemmonitor filelight spectacle krita kolourpaint kwallet kwalletmanager --needed --noconfirm

# Printing
paru -Sy cups cups-pdf print-manager system-config-printer epson-inkjet-printer-escpr{,2} --needed --noconfirm

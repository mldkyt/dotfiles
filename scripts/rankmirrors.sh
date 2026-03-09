#!/bin/bash

sudo pacman -Sy reflector rsync --noconfirm --needed
sudo systemctl enable reflector.timer
sudo bash -c 'echo "--save /etc/pacman.d/mirrorlist" > /etc/reflector.conf'
sudo bash -c 'echo "--protocol https,rsync" >> /etc/reflector.conf'
sudo bash -c 'echo "--country Czechia,Germany,Poland,Austria,Slovakia" >> /etc/reflector.conf'
sudo bash -c 'echo "--latest 200" >> /etc/reflector.conf'
sudo bash -c 'echo "--sort rate" >> /etc/reflector.conf'
sudo bash -c 'echo "--connection-timeout 1" >> /etc/reflector.conf'
sudo bash -c 'echo "--download-timeout 1" >> /etc/reflector.conf'
sudo systemctl start reflector.timer

sudo reflector --save /etc/pacman.d/mirrorlist --protocol https --latest 100 --sort rate --connection-timeout 1 --download-timeout 1 --threads 2 --verbose

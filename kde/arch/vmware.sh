#!/bin/bash

paru -Sy --noconfirm --needed vmware-keymaps
paru -Sy --noconfirm --needed vmware-workstation

sudo systemctl enable vmware-{networks,usbarbitrator}.path

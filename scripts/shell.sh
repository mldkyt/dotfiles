#!/bin/bash

paru -Sy --noconfirm --needed zsh zsh-completions

# MANUAL INTERVENTION

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

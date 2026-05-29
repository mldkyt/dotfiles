#!/bin/bash

paru -Sy --noconfirm --needed zsh zsh-completions

# MANUAL INTERVENTION

if [ -f ~/.oh-my-zsh ]; then
    chsh -s "$(which zsh)"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


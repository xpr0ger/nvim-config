#!/bin/bash

if ! command -v pacman &>/dev/null; then
    echo "pacman command required to proceed"
    exit 1
fi

fn_confirm_action "$(
    cat <<EOL
Starting installation
Next step will prompt you for password to install pacman packages
Would you like to proceed?
EOL
)"

# Installing system packages yay package manager required
sudo pacman --needed -Syu \
    luarocks \
    unzip \
    go \
    git \
    cargo \
    npm \
    nodejs \
    python-pip \
    python-neovim \
    ripgrep \
    fd

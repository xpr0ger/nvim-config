#!/bin/bash
if ! command -v apt-get &> /dev/null; then
    echo "apt-get command required to proceed"
    exit 1
fi

fn_confirm_action "$(cat << EOL 
Starting installation
Next step will prompt you for password to install packages
Would you like to proceed?
EOL
)"

# Installing system packages yay package manager required
sudo apt-get install \
    luarocks \
    unzip \
    golang \
    git \
    cargo \
    npm \
    nodejs \
    python3-pip \
    ripgrep \
    fd-find

pip3 install --break-system-package --user neovim

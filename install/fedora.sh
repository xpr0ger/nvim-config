# !/bin/bash

if ! command -v dnf &> /dev/null; then
    echo "dnf command required to proceed"
    exit 1
fi

fn_confirm_action "$(cat << EOL 
Starting installation
Next step will prompt you for password to install dnf packages
Would you like to proceed?
EOL)"

# Installing system packages yay package manager required
sudo dnf install \
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
    fd-find

if [ "$SSH_SESSION" != "" ]; then
    sudo dnf install xclip
fi

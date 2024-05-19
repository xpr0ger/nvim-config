# !/bin/bash

# Installing system packages yay package manager required
yay --needed -Syu unzip \
    go \
    git \
    cargo \
    npm \
    nodejs \
    python-pip \
    python-neovim \
    ripgrep \
    fd \
    xclip


DEFAULT_FONT_DIRECTORY=~/.local/share/fonts
FONT_DIRECTORY="MesloLGS-NF"
if [[ ! -d "$DEFAULT_FONT_DIRECTORY/$FONT_DIRECTORY" ]]; then
    mkdir -p "$DEFAULT_FONT_DIRECTORY/$FONT_DIRECTORY"
fi

URL_MESLO_REGULAR='https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
URL_MESLO_BOLD='https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf'
URL_MESLO_ITALIC='https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf'
URL_MESLO_BOLD_ITALIC='https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf'

URLS=("$URL_MESLO_REGULAR" "$URL_MESLO_BOLD" "$URL_MESLO_ITALIC" "$URL_MESLO_BOLD_ITALIC")
for URL in "${URLS[@]}"; do
    wget "$URL" -P "$DEFAULT_FONT_DIRECTORY/$FONT_DIRECTORY"
done

fc-cache -f -v

npm config set prefix '~/.local/'
npm install neovim

if [[ "$PATH" != *"~/.local/bin"* ]] then
    echo -e "\033[0;31mYou have to add '~/.local/bin to your PATH variable\033[0m"
fi

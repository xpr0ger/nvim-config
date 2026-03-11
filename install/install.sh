#!/bin/bash
#

# Defining current directory full path
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

DISTRO="$1"

# Check if ssh connection is being used
if [ "$SSH_CLIENT" != "" ] || [ "$SSH_TTY" != "" ] || [ "$SSH_CONNECTION" != "" ]; then
    export SSH_SESSION=true
fi

# Check if fc-cache command exists, thus it make sense to install custom fonts
if command -v fc-cache &>/dev/null; then
    export INSTALL_FONTS=true
fi

# Bash helper for conformation
fn_confirm_action() {
    if [ "${1}" = "" ]; then
        echo "function ${0} missing parameter"
        exit 1
    fi

    read -r -p "${1} [Y/n]:" CONFORMATION
    if [ "$CONFORMATION" != "" ] && [[ "$CONFORMATION" != [yY] ]]; then
        echo "Aborting"
        exit 1
    fi
}

# Applying distro specific changes
case "$DISTRO" in
"archlinux")
    # shellcheck source=/dev/null
    source "${SCRIPT_DIR}/archlinux.sh"
    ;;
"fedora")
    # shellcheck source=/dev/null
    source "${SCRIPT_DIR}/fedora.sh"
    ;;
"ubuntu")
    # shellcheck source=/dev/null
    source "${SCRIPT_DIR}/ubuntu.sh"
    ;;
"cloudtop")
    # shellcheck source=/dev/null
    source "${SCRIPT_DIR}/cloudtop.sh"
    ;;
*)
    echo "Unknown linux distribution name ${DISTRO}"
    exit 1
    ;;
esac

#Installing custom fonts
if [ "$INSTALL_FONTS" != "" ]; then
    DEFAULT_FONT_DIRECTORY=~/.local/share/fonts
    FONT_DIRECTORY="MesloLGS-NF"
    # Creating target directory if not exists
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

    # Updating font cache
    fc-cache -f -v
fi

# Configuring npm for neovim
npm config set prefix "${HOME}/.local/"
npm install -g neovim

# Installing delve
go install github.com/go-delve/delve/cmd/dlv@latest

NPM_BIN_PATH="${HOME}/.local/bin"
if [[ "$PATH" != *"$NPM_BIN_PATH"* ]]; then
    echo -e "\033[0;31mYou have to add '${NPM_BIN_PATH}' to your PATH variable\033[0m"
fi

GO_BIN_PATH="${HOME}/go/bin"
if [[ "$PATH" != *"$GO_BIN_PATH"* ]]; then
    echo -e "\033[0;31mYou have to add '${GO_BIN_PATH}' to your PATH variable\033[0m"
fi

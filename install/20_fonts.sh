#!/usr/bin/env bash

set -e

FONTS_PATH="${HOME}/.fonts"
FONT_NAME="Hack_Regular_Nerd_Font_Complete_Mono.ttf"
FONT_URL='https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf'

cd "$(dirname "$0")/.."

source lib/colors.sh

if [[ ! -n $(find ${FONTS_PATH} -iname ${FONT_NAME}) ]]; then
    echo "==> ${LBLUE}Installing Hack patched font…${END}"
    mkdir -p "${FONTS_PATH}"
    curl -fLo "${FONTS_PATH}/${FONT_NAME}" ${FONT_URL}
fi

fc-cache -vf ${FONTS_PATH}

echo "==> ${LBLUE}Linking Konsole and Yakuake configuration…${END}"
mkdir -p ~/.kde/share/apps/konsole
ln -sf $(pwd)/etc/kde/share/apps/konsole/Shell.profile ~/.kde/share/apps/konsole/Shell.profile
ln -sf $(pwd)/etc/kde/share/apps/konsole/Yakuake.profile ~/.kde/share/apps/konsole/Yakuake.profile

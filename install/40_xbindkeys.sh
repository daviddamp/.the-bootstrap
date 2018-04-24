#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/colors.sh

echo "==> ${LBLUE}Linking xbindkeys configuration…${END}"
ln -sf $(pwd)/etc/xbindkeysrc ~/.xbindkeysrc

if ! pgrep xbindkeysx &> /dev/null; then
    echo "==> ${LBLUE}Launching xbindkeys…${END}"
    xbindkeys -f ~/.xbindkeysrc
fi

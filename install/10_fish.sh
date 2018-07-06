#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh

echo "==> ${LBLUE}Installing Fish…${END}"
if grep --quiet '^ID=ubuntu' /etc/os-release; then
    if [ ! -f /etc/apt/sources.list.d/fish-shell-ubuntu-release-2-xenial.list ]; then
        sudo apt-add-repository ppa:fish-shell/release-2
        sudo apt-get update
    fi
    sudo apt-get install fish -y
elif grep --quiet '^ID=opensuse' /etc/os-release; then
	sudo zypper install fish
else
    echo "==> ${RED}ERROR: OS not supported! The supported systems are: Ubuntu|OpenSuse${END}"
    exit 1
fi

echo "==> ${LBLUE}Linking Fish configuration…${END}"
directory ~/.config/fish
linked $(pwd)/etc/fish/aliases.fish ~/.config/fish/aliases.fish
linked $(pwd)/etc/fish/config.fish ~/.config/fish/config.fish

echo "==> ${LBLUE}Installing Fisherman…${END}"
directory ~/.config/fish/functions
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

echo "==> ${LBLUE}Installing Fisherman dependencies…${END}"
cat requirements/fisher.txt | grep -v '^#' | while IFS= read package; do
    echo "--> ${LYELLOW}${package}${END}…"
    fish -c "fisher $package"
done

echo "==> ${LBLUE}Making Fish the default shell…${END}"
chsh -s `which fish`

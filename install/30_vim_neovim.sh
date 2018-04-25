#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh

echo "==> ${LBLUE}Linking Vim configuration…${END}"
directory ~/.vim

linked $(pwd)/etc/vim/ftplugin ~/.vim/
#linked $(pwd)/etc/vim/ftdetect ~/.vim/
linked $(pwd)/etc/vim/UltiSnips ~/.vim/
linked $(pwd)/etc/vim/vimrc ~/.vimrc
linked $(pwd)/etc/vim/vimrc.local ~/.vimrc.local
linked $(pwd)/etc/vim/vimrc.local.bundles ~/.vimrc.local.bundles

echo "==> ${LBLUE}Install NeoVim…${END}"
directory ~/bin
download https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage ~/bin/nvim
chmod u+x  ~/bin/nvim

# if grep --quiet '^ID=ubuntu' /etc/os-release; then
#     if [ ! -f /etc/apt/sources.list.d/neovim-ppa-ubuntu-stable-xenial.list ]; then
#         sudo add-apt-repository -y ppa:neovim-ppa/stable
#     fi
#     sudo apt-get update
#     sudo apt-get install neovim -y
# fi

echo "==> ${LBLUE}Linking NeoVim configuration…${END}"
directory ~/.config/nvim

linked $(pwd)/etc/vim/vimrc ~/.config/nvim/init.vim
linked ~/.vim ~/.nvim

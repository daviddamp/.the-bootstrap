#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/colors.sh

echo "==> ${LBLUE}Linking Vim configuration…${END}"
mkdir -p ~/.vim

ln -sf $(pwd)/etc/vim/ftplugin ~/.vim/
#ln -sf $(pwd)/etc/vim/ftdetect ~/.vim/
ln -sf $(pwd)/etc/vim/UltiSnips ~/.vim/
ln -sf $(pwd)/etc/vim/vimrc ~/.vimrc
ln -sf $(pwd)/etc/vim/vimrc.local ~/.vimrc.local
ln -sf $(pwd)/etc/vim/vimrc.local.bundles ~/.vimrc.local.bundles

echo "==> ${LBLUE}Linking NeoVim configuration…${END}"
mkdir -p ~/.config/nvim

ln -sf $(pwd)/etc/vim/vimrc ~/.config/nvim/init.vim
ln -sf ~/.vim ~/.nvim

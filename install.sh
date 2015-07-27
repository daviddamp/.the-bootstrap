#!/bin/bash
cd "$(dirname "$0")"

sudo apt-get install python-dev python-pip python3-dev python3-pip git mercurial yakuake xsel xbindkeys aptitude

# Powerline
pip install --user git+git://github.com/Lokaltog/powerline

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# Vim
sudo apt-get install vim
mkdir ~/.vim
ln -s $(pwd)/etc/vim/ftplugin ~/.vim/
#ln -s $(pwd)/etc/vim/ftdetect ~/.vim/
ln -s $(pwd)/etc/vim/UltiSnips ~/.vim/

ln -s $(pwd)/etc/vim/vimrc ~/.vimrc
ln -s $(pwd)/etc/vim/vimrc.local ~/.vimrc.local
ln -s $(pwd)/etc/vim/vimrc.local.bundles ~/.vimrc.local.bundles

# Nvim
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update
sudo apt-get install neovim
sudo pip install neovim
ln -s $(pwd)/etc/vim/vimrc ~/.nvimrc
ln -s $(pwd)/etc/vim/vimrc.local ~/.nvimrc.local
ln -s $(pwd)/etc/vim/vimrc.local.bundles ~/.nvimrc.local.bundles
ln -s ~/.vim ~/.nvim

# Bashrc
if ! grep --quiet 'By the-bootstrap:' ~/.bashrc ; then
	cat >> ~/.bashrc << EOF

# By the-bootstrap:
source $(pwd)/etc/bashrc
EOF
fi

ln -s $(pwd)/etc/xbindkeysrc ~/.xbindkeysrc
xbindkeys

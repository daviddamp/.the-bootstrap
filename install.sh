#!/bin/bash
cd "$(dirname "$0")"

if grep --quiet '^ID=opensuse' /etc/os-release; then
	sudo zypper install python3-devel python-devel git xbindkeys Yakuake xsel curl tree htop file-unpack encfs xvkbd
else
	sudo apt-get install python-dev python-pip python3-dev python3-pip git mercurial yakuake xsel xbindkeys aptitude curl htop tree x2goclient unp xvkbd encfs
fi

# Powerline
pip3 install --user git+git://github.com/Lokaltog/powerline

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# # Source Code Pro font
# pushd .
# dir=`mktemp -d` && cd $dir
# wget https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.tar.gz && tar xzfv 1.030R-it.tar.gz && cp source-code-pro-2.010R-ro-1.030R-it/OTF/* ~/.fonts/
# fc-cache -vf ~/.fonts
# #rm -Rf dir
# popd

# Source Code Nerd Font
pushd .
mkdir -p ~/.fonts
cd ~/.fonts && curl -fLo "Sauce Code Pro Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf
# mkdir -p ~/.local/share/fonts
# cd ~/.local/share/fonts && curl -fLo "Sauce Code Pro Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf
popd

# Vim
if grep --quiet '^ID=opensuse' /etc/os-release; then
	echo TODO
else
	sudo apt-get install vim vim-athena-py2
fi
mkdir ~/.vim
ln -s $(pwd)/etc/vim/ftplugin ~/.vim/
#ln -s $(pwd)/etc/vim/ftdetect ~/.vim/
ln -s $(pwd)/etc/vim/UltiSnips ~/.vim/

ln -s $(pwd)/etc/vim/vimrc ~/.vimrc
ln -s $(pwd)/etc/vim/vimrc.local ~/.vimrc.local
ln -s $(pwd)/etc/vim/vimrc.local.bundles ~/.vimrc.local.bundles

# Nvim
if grep --quiet '^ID=opensuse' /etc/os-release; then
	mkdir -p ~/bin
	cd ~/bin
	curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
	chmod u+x nvim.appimage
	mv nvim.appimage nvim
else
	sudo add-apt-repository ppa:neovim-ppa/unstable -y
	sudo apt-get update
	sudo apt-get install neovim
fi
pip3 install --user neovim jedi psutil setproctitle
pip2 install --user neovim jedi psutil setproctitle

mkdir ~/.config/nvim
ln -s $(pwd)/etc/vim/vimrc ~/.config/nvim/init.vim
ln -s ~/.vim ~/.nvim

# Bashrc
if ! grep --quiet 'By the-bootstrap:' ~/.bashrc ; then
	cat >> ~/.bashrc << EOF

# By the-bootstrap:
source $(pwd)/etc/bashrc
EOF
fi

# Fish shell
if grep --quiet '^ID=opensuse' /etc/os-release; then
	sudo zypper install fish
else
	sudo apt-add-repository ppa:fish-shell/release-2
	sudo apt-get update
	sudo apt-get install fish
fi
mkdir -p ~/.config/fish/functions
ln -s $(pwd)/etc/fish/* ~/.config/fish
# Fisherman
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
# Bass
fisher edc/bass
# Z
fisher z

# xbindkeys
ln -s $(pwd)/etc/xbindkeysrc ~/.xbindkeysrc
xbindkeys

# ksuperkey
if grep --quiet '^ID=opensuse' /etc/os-release; then
	echo TODO
else
	sudo add-apt-repository ppa:mehanik/ksuperkey -y
	sudo apt-get update
	sudo apt-get install ksuperkey

	mkdir -p ~/.kde/Autostart
	cat > ~/.kde/Autostart/ksuperkey.sh << EOF
#!/bin/sh
killall ksuperkey
ksuperkey -e 'Super_L=Alt_L|F1;Super_R=Alt_L|F2'
EOF
	chmod +x ~/.kde/Autostart/ksuperkey.sh
	~/.kde/Autostart/ksuperkey.sh
fi

# Google YAPF (code formatter)
pip3 install --user yapf

# howdoi command
pip3 install --user howdoi

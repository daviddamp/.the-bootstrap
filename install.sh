#!/bin/bash

cd "$(dirname "$0")"

if [ -n "$1" ]; then
	if [[ "$1" == "server" ]]; then
		sudo apt-get install git mercurial aptitude curl htop tree unp screen -y

		ln -s $(pwd)/etc/screenrc ~/.screenrc

		# # Vim
		# sudo apt-get install vim -y
		# mkdir ~/.vim
		# ln -s $(pwd)/etc/vim/ftplugin ~/.vim/
		# #ln -s $(pwd)/etc/vim/ftdetect ~/.vim/
		# ln -s $(pwd)/etc/vim/UltiSnips ~/.vim/

		# ln -s $(pwd)/etc/vim/vimrc ~/.vimrc
		# ln -s $(pwd)/etc/vim/vimrc.local ~/.vimrc.local
		# ln -s $(pwd)/etc/vim/vimrc.local.bundles ~/.vimrc.local.bundles

		# # Nvim
		# sudo add-apt-repository ppa:neovim-ppa/unstable -y
		# sudo apt-get update
		# sudo apt-get install neovim
		# sudo pip install neovim
		# ln -s $(pwd)/etc/vim/vimrc ~/.nvimrc
		# ln -s $(pwd)/etc/vim/vimrc.local ~/.nvimrc.local
		# ln -s $(pwd)/etc/vim/vimrc.local.bundles ~/.nvimrc.local.bundles
		# ln -s ~/.vim ~/.nvim

		# Bashrc
		if ! grep --quiet 'By the-bootstrap:' ~/.bashrc ; then
			cat >> ~/.bashrc << EOF

# By the-bootstrap:
source $(pwd)/etc/bashrc server
EOF
		fi
	else
		echo "Sorry, I don't understand '$1' option."
	fi
else
	sudo apt-get install python-dev python-pip python3-dev python3-pip git mercurial yakuake xsel xbindkeys aptitude curl htop tree x2goclient unp xvkbd -y

	# Powerline
	pip install --user git+git://github.com/Lokaltog/powerline

	wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
	mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
	fc-cache -vf ~/.fonts
	mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

	# Source Code Pro font
	pushd .
	dir=`mktemp -d` && cd $dir
	wget https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.tar.gz && tar xzfv 1.030R-it.tar.gz && cp source-code-pro-2.010R-ro-1.030R-it/OTF/* ~/.fonts/
	fc-cache -vf ~/.fonts
	#rm -Rf dir
	popd

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

	# ksuperkey
	sudo add-apt-repository ppa:mehanik/ksuperkey -y
	sudo aptitude update
	sudo aptitude install ksuperkey
	cat > ~/.kde/Autostart/ksuperkey.sh << EOF
#!/bin/sh
killall ksuperkey
ksuperkey -e 'Super_L=Alt_L|F1;Super_R=Alt_L|F2'
EOF
	chmod +x ~/.kde/Autostart/ksuperkey.sh
	~/.kde/Autostart/ksuperkey.sh
fi

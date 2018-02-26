. ~/.config/fish/aliases.fish

function fish_greeting
	set_color $fish_color_autosuggestion
	uname -nmsr
	echo (lsb_release -s -d) "|" (lsb_release -s -r) (lsb_release -s -c)
	# uptime
	set_color normal
end

function fish_prompt
    powerline-shell --shell bare $status
end

set PATH $PATH $HOME/bin $HOME/.local/bin /snap/bin $HOME/Programas/anaconda3/bin/

# Disable copy deleted words to clipboard
set FISH_CLIPBOARD_CMD "cat"

# set -gx EDITOR vim
# set -U EDITOR vim

if test -e ~/.nvm/nvm.sh
	bass export NVM_DIR="$HOME/.nvm"
	bass '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'  # This loads nvm
end

# Fix error "QXcbConnection: Could not connect to display :0"
# set -x QT_QPA_PLATFORM offscreen

set fish_function_path $fish_function_path "$HOME/.local/lib/python2.7/site-packages/powerline/bindings/fish"

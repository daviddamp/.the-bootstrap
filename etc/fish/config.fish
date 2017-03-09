. ~/.config/fish/aliases.fish

# Disable copy deleted words to clipboard
set FISH_CLIPBOARD_CMD "cat"

# set -gx EDITOR vim
# set -U EDITOR vim

if test -e ~/.nvm/nvm.sh
	bass export NVM_DIR="$HOME/.nvm"
	bass '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'  # This loads nvm
end

set fish_function_path $fish_function_path "/home/cristobal/.local/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup

alias l "ls -hlA"
alias lo "ls -hlAtr"
alias ll "ls -hlASr"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias , "cd -"
abbr -a -- + 'pushd .'
abbr -a -- - 'popd'

# function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# ? () { echo "$*" | bc -l; }
function =
	echo "$argv" | bc -l
end

alias today "date +%F"
# alias pylab='ipython -pylab'
# alias wcat='wget -qO-'

alias here "pwd | xsel --clipboard"
alias there 'cd (xsel --clipboard)'

alias vims "env TERM=xterm-256color vim -S Session.vim"
alias vim "env TERM=xterm-256color vim -p"
# alias nv='nvim -u ~/.nvimrc -p'

alias lost "clear; tail -n 52 ~/lost.txt; cat >> ~/lost.txt"

# alias privateOn='encfs ~/Dropbox/.private/ ~/Privado'
# alias privateOff='fusermount -u /home/$USER/Privado'

# # Top 10 biggest files/directories in the current directory:
# # https://plus.google.com/+MattMight/posts/6NJJeExpqQW
# alias ducks='du -cks * | sort -rn | head'

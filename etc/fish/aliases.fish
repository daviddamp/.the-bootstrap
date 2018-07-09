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

function mkcd
    mkdir "$argv"; and cd "$argv"
end

# ? () { echo "$*" | bc -l; }
function =
	echo "$argv" | bc -l
end

function install_deb
    sudo dpkg -i "$argv"; and sudo apt-get -f install -y
end

alias today "date +%F"
# alias pylab='ipython -pylab'
# alias wcat='wget -qO-'

alias here "printf (pwd) | xsel --clipboard"
alias there 'cd (xsel --clipboard)'

# alias vims "env TERM=xterm-256color vim -S Session.vim"
# alias vim "env TERM=xterm-256color vim -p"
# alias vims "env TERM=xterm-256color vim.athena-py2 -S Session.vim"
# alias vim "env TERM=xterm-256color vim.athena-py2 -p"
alias vi "vim.athena-py2 -u NONE"
alias vim "vim.athena-py2"
alias nv "env TERM=xterm-256color nvim"

alias gc "git commit"
alias gcv "git commit --no-verify"

# alias lost "clear; tail -n 52 ~/lost.txt; cat >> ~/lost.txt"
alias lost "cat ~/lost.txt; cat >> ~/lost.txt"

# alias privateOn='encfs ~/Dropbox/.private/ ~/Privado'
# alias privateOff='fusermount -u /home/$USER/Privado'

# Top 10 biggest files/directories in the current directory:
# https://plus.google.com/+MattMight/posts/6NJJeExpqQW
alias ducks='du -cks * | sort -rn | head'
# alias unp 'file-unpack'

# Disk ussage for each directory with depth=1
alias dud='du . -hd1'

# Find and remove *.pyc
# http://stackoverflow.com/questions/785519/how-do-i-remove-all-pyc-files-from-a-project
alias pycdel='find . -name \*.pyc -delete'

alias mkenv="virtualenv -p python3 .env"
alias ienv="source .env/bin/activate.fish"
alias oenv="deactivate"

alias initpy='touch __init__.py'
function mkpy
    mkdir "$argv"; and touch $argv/__init__.py
end

# git
alias g 'git'
alias gi 'git init'
alias gs 'git status -u'
alias gconfdiff 'git diff --diff-filter=U'
alias gconflict 'git diff --name-only --diff-filter=U'
alias gd 'git diff'
alias ga 'git add .'
abbr -a gc 'git commit -am'
abbr -a gp 'git push'
alias gpom 'git push -u origin master'
alias gc 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a gm 'git merge --no-ff'

# screen
alias scr 'env TERM=xterm-256color screen -x; or env TERM=xterm-256color screen'

# Deepo
abbr -a deepo "nvidia-docker run --rm ufoym/deepo"

# .the-bootstrap
alias .tbcd 'cd ~/.the-bootstrap'
alias .tbed 'cd ~/.the-bootstrap; and eval $EDITOR'

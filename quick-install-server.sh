# Call with:
# $ bash <(curl -s https://raw.githubusercontent.com/cristobalcl/.the-bootstrap/master/quick-install-server.sh)

# Bashrc
if ! grep --quiet 'By the-bootstrap:' ~/.bashrc ; then
	cat >> ~/.bashrc << EOF

# By the-bootstrap:
export PS1="\[\033[1;34m\]\u@\H \[\033[1;33m\]\w\[\033[0m\]\$ "

alias l='ls -hlA'
alias lo='ls -hlAtr'
alias ll='ls -hlASr'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- ,='cd -'
alias -- +='pushd .'
alias -- -='popd'
EOF
fi

cat > ~/.screenrc < EOF
startup_message off
altscreen on
term screen-256color

hardstatus alwayslastline
hardstatus string '%{= kG}[ %{G}%H %{g}][%= %{= kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}][%{B} %d/%m %{W}%c %{g}]'

shelltitle "$ |bash"

termcapinfo xterm|xterms|xs|rxvt ti@:te@

screen -t terminal
screen -t terminal
screen -t terminal
screen -t terminal
screen -t terminal

bindkey -k k1 focus
bindkey -k k3 prev
bindkey -k k4 next
bindkey -k k5 copy
bindkey -k k6 split
bindkey -k k7 remove
bindkey -k k8 detach
bindkey -k k9 quit
EOF

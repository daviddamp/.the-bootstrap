# Install with:
# $ bash <(curl -s https://raw.githubusercontent.com/daviddamp/.the-bootstrap/master/properscreen.sh)

if [ ! -f ~/.screenrc ]; then
    cat > ~/.screenrc << EOF
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
fi

# .the-bootstrap
Personal configuration.

## Installation

```bash
cd
git clone https://github.com/cristobalcl/.the-bootstrap.git
.the-bootstrap/install.sh
```
## Quick installation for servers

```bash
bash <(curl -s https://raw.githubusercontent.com/cristobalcl/.the-bootstrap/master/quick-install-server.sh)
```

## Really quick copy/paste Bash configuration

```bash
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
```

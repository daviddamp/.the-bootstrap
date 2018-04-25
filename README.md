.the-bootstrap
==============

Personal configuration.

Installation
------------

```bash
sudo apt update && sudo apt install git && cd && \
    git clone https://github.com/cristobalcl/.the-bootstrap.git &&
    .the-bootstrap/bootstrap.sh
```

Features
--------

For (K)ubuntu and OpenSuse (experimental).

### Bash & Fish

### powerline-shell

### Vim & NeoVim

### xbindkeys

**Spotify** shortcuts:

- `ALT + z`: Previous
- `ALT + x`: Pause
- `ALT + c`: Play
- `ALT + v`: Next

`amixer` shortcuts:

- `ALT + "+"`: Volume up
- `ALT + "-"`: Volume down

**Music On Console Player** shortcuts:

- `ALT + a`: Previous
- `ALT + s`: Pause
- `ALT + d`: Play
- `ALT + f`: Next

Others:

- `ALT + t`: Insert today date in ISO format
- `ALT + p`: Insert random password

### Ubuntu drivers for NVIDIA

To activate run the script like this:

```bash
TB_NVIDIA=true .the-bootstrap/bootstrap.sh
```

Appendix
--------

### Quick installation for servers

```bash
bash <(curl -s https://raw.githubusercontent.com/cristobalcl/.the-bootstrap/master/quick-install-server.sh)
```

### Really quick copy&paste Bash session configuration

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

### References

- [dotfiles](https://dotfiles.github.io/)

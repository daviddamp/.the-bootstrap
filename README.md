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

### Other steps

- Install recommended drivers: `ALT + F2` -> `kcmshell5 kcm_driver_manager`
- Open Yakuake: `ALT + F2` -> `yakuake`
- Open Dropbox: `ALT + F2` -> `dropbox`
- Create ssh keys: `ssh-keygen -t rsa -b 4096 -C "ccarnerolinan@gmail.com"`
- Start `ssh-agent`: `eval "$(ssh-agent -s)"`
- Add ssh key: `ssh-add ~/.ssh/id_rsa`
- Configure new key in [GitHub](https://github.com/settings/ssh/new)

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

### Scripts

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

Troubleshooting
---------------

### Ethernet network not working after Kubuntu 16.04 install

Install Kubuntu again without connecting the cable :(

### Glitches around mouse pointer in Kubuntu with NVIDIA

1. Install latest NVIDIA driver.
2. Go to `System setting -> Display and Monitor -> Compositor -> Rendering Backend` and change OpenGL 2.0 to XRender.

Source: [Ubuntu Forums](https://ubuntuforums.org/showthread.php?t=2358926&s=a0573c29ff5f56dff90cf77418efa722&p=13679079#post13679079)

### Docker permission denied

Full error message:

```
docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.sock/v1.37/containers/create: dial unix /var/run/docker.sock: connect: permission denied.
```

Solution:

```bash
sudo usermod -a -G docker $USER
```

Source: [Techoverflow](https://techoverflow.net/2017/03/01/solving-docker-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket/)

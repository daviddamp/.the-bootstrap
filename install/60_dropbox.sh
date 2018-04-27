#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/colors.sh

if [ ! -z "${TB_DROPBOX}" ]; then
    if grep --quiet '^ID=ubuntu' /etc/os-release; then
        if ! grep dropbox /etc/apt/sources.list; then
            echo "==> ${LBLUE}Adding Dropbox repository…${END}"
            echo -e "\ndeb [arch=i386,amd64] http://linux.dropbox.com/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list
            sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
            sudo aptitude update
            echo "==> ${LBLUE}Install Dropbox…${END}"
            sudo aptitude install -y dropbox
        fi
    fi
else
    echo "==> ${BROWN}Warning! \$TB_DROPBOX variable is not set. Skip install Dropbox!${END}"
fi

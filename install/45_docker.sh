#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/colors.sh

if ! command -v docker &> /dev/null; then
    if grep --quiet '^ID=ubuntu' /etc/os-release; then
        if ! grep --quiet 'download.docker.com' /etc/apt/sources.list; then
            echo "==> ${LBLUE}Adding Docker key…${END}"
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
            sudo apt-key fingerprint 0EBFCD88

            echo "==> ${LBLUE}Adding Docker repository…${END}"
            sudo add-apt-repository \
                "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                $(lsb_release -cs) \
                stable"
            sudo apt-get update

            echo "==> ${LBLUE}Installing Docker…${END}"
            sudo apt-get install docker-ce -y

            echo "==> ${LBLUE}Fixing user permissions…${END}"
            sudo usermod -a -G docker $USER
        fi
    fi
fi

if ! command -v docker-compose &> /dev/null; then
    DC_VERSION=`curl https://github.com/docker/compose/releases/ 2> /dev/null | grep '/download/' | head -n 1 | grep -oh -m 1 '[0-9]\+\.[0-9]\+\.[0-9]\+'`
    echo "==> ${LBLUE}Installing docker-compose ${DC_VERSION}…${END}"
    curl -L https://github.com/docker/compose/releases/download/${DC_VERSION}/docker-compose-$(uname -s)-$(uname -m) -o ~/bin/docker-compose
    chmod +x ~/bin/docker-compose
fi

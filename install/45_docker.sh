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

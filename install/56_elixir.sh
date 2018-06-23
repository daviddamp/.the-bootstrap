#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh

if ! command -v iex &> /dev/null; then
    if grep --quiet '^ID=ubuntu' /etc/os-release; then
        echo "==> ${LBLUE}Adding Elixir repository…${END}"
        download https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb /tmp/erlang.deb
        sudo dpkg -i /tmp/erlang.deb
        rm /tmp/erlang.deb

        echo "==> ${LBLUE}Installing Erlang/OPT platform…${END}"
        sudo apt-get update
        sudo apt-get install -y esl-erlang

        echo "==> ${LBLUE}Installing Elixir…${END}"
        sudo apt-get install -y elixir
    fi
fi

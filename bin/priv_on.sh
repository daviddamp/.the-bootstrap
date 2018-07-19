#!/usr/bin/env bash

set -e

mkdir -p $HOME/Privado

if [ -d $HOME/Dropbox ]; then
    mkdir -p $HOME/Dropbox/.private
    encfs $HOME/Dropbox/.private/ $HOME/Privado
else
    mkdir -p $HOME/.private
    encfs $HOME/.private/ $HOME/Privado
fi

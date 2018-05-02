#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
    echo "Use $0 [GREP_PATTERN]"
    echo "Restore packages which contain files with the given pattern."
    echo
    echo "Example: $0 '\.png$'"
fi

dpkg --get-selections | awk '$2=="install" { print $1}' | while IFS= read pkg; do
    if dpkg -L $pkg | grep -q $1; then
        echo $pkg
        sudo apt-get --reinstall install -y $pkg
    fi
done

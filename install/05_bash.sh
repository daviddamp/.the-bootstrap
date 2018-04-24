#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/colors.sh

if ! grep --quiet '^# By the-bootstrap:' ~/.bashrc ; then
    echo "==> ${LBLUE}Linking Bash config…${END}"
	cat >> ~/.bashrc << EOF

# By the-bootstrap:
source $(pwd)/etc/bashrc
EOF
fi

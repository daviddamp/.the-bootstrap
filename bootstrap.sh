#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

source lib/colors.sh
source lib/logo.sh

print_logo
echo

echo "==> ${LBLUE}Running install scripts…${END}"
ls -1 install/*.sh | while IFS= read file_path; do
    echo "[${LYELLOW}$(basename $file_path)${END}]"
    echo "${LBLUE}--------------------------------------------------------------------------------${END}"
    eval "$file_path"
    echo
done

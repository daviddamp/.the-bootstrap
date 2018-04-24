#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

source lib/colors.sh

toilet -f future --filter border:metal ".the-bootstrap" || echo "${BLUE}.the-bootstrap${END}"
echo

echo "==> ${LBLUE}Running install scripts…${END}"
ls -1 install/*.sh | while IFS= read file_path; do
    echo "[${LYELLOW}$(basename $file_path)${END}]"
    echo "${LBLUE}--------------------------------------------------------------------------------${END}"
    eval "$file_path"
    echo
done

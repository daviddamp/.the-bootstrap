#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

source lib/colors.sh

# Print the ASCII art logo
base64 -d <<<"H4sIALiW31oAA5WTQQ6CMBBF916BDUfAQGJIj+IZuIPA1kQTptGEJUuXbgRu05PQqdDpWESbsJj+
+dN5U9romIi9SDORZ4WCs4LT/1+ka1MsC6hZyg7bZVdtKnYRg6tQi5kmBwVPJV9KjivJ0QJeFJTa
Zjxx7MqNrSMjNBTIweKaRk7iU+HBjJKIPCmMWNmRUpqGOtccpDN7PTCYuZcUNi5NY+0ZLV3DtkCl
9pXN5e2N/81Dw3Q4ObQMEoPWH1LJnsP/Xjow/I8RY+sHPqazN6EHuWWPBXi71pOzzG+dewRIDMFv
g2jD3xVhbDjvhnACOi/qY/oDAAA=" | gunzip
echo


echo "==> ${LBLUE}Running install scripts…${END}"
ls -1 install/*.sh | while IFS= read file_path; do
    echo "[${LYELLOW}$(basename $file_path)${END}]"
    echo "${LBLUE}--------------------------------------------------------------------------------${END}"
    eval "$file_path"
    echo
done

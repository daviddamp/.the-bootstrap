#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/colors.sh

if grep --quiet '^ID=ubuntu' /etc/os-release; then
    echo "==> ${LBLUE}Updating system…${END}"
    sudo apt update && sudo apt install aptitude -y
    sudo aptitude safe-upgrade -y
    echo "==> ${LBLUE}Installing Ubuntu dependencies…${END}"
    cat requirements/apt.txt | grep -v '^#' | sudo xargs aptitude install -y
elif grep --quiet '^ID=opensuse' /etc/os-release; then
    cat requirements/zypper.txt | grep -v '^#' | sudo xargs zypper install -y
else
    echo "==> ${RED}ERROR: OS not supported! The supported systems are: Ubuntu|OpenSuse${END}"
fi

echo "==> ${LBLUE}Installing Python 2 dependencies…${END}"
cat requirements/pip2.txt | grep -v '^#' | while IFS= read package; do
    echo "--> ${LYELLOW}${package}${END}…"
    pip2 install --upgrade --user $package
done

echo "==> ${LBLUE}Installing Python 3 dependencies…${END}"
cat requirements/pip3.txt | grep -v '^#' | while IFS= read package; do
    echo "--> ${LYELLOW}${package}${END}…"
    pip3 install --upgrade --user $package
done

echo "==> ${LBLUE}Installing Snap dependencies…${END}"
cat requirements/snap.txt | grep -v '^#' | while IFS= read package; do
    echo "--> ${LYELLOW}${package}${END}…"
    sudo snap install $package || sudo snap refresh $package
done

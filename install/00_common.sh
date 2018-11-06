#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh

if grep --quiet '^ID=ubuntu' /etc/os-release; then
    echo "==> ${LBLUE}Updating system…${END}"
    sudo apt update && sudo apt install aptitude -y
    sudo aptitude safe-upgrade -y
    echo "==> ${LBLUE}Installing Ubuntu dependencies…${END}"
    cat requirements/apt.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | sudo xargs aptitude install -y
elif grep --quiet '^ID=opensuse' /etc/os-release; then
    cat requirements/zypper.txt | grep -v '^#' | sudo xargs zypper install -y
else
    echo "==> ${RED}ERROR: OS not supported! The supported systems are: Ubuntu|OpenSuse${END}"
fi

echo "==> ${LBLUE}Installing Debian packages dependencies…${END}"
cat requirements/deb.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read package; do
    echo "--> ${LYELLOW}${package}${END}…"
    download ${package} /tmp/package.deb
    sudo dpkg -i /tmp/package.deb
done

# echo "==> ${LBLUE}Installing Homebrew…${END}"
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# echo "==> ${LBLUE}Installing Homebrew dependencies…${END}"
# cat requirements/brew.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read package; do
#     echo "--> ${LYELLOW}${package}${END}…"
#     brew install $package
# done

echo "==> ${LBLUE}Updating pip2…${END}"
#sudo pip2 install --upgrade pip

echo "==> ${LBLUE}Updating pip3…${END}"
sudo pip3 install --upgrade pip

echo "==> ${LBLUE}Installing Python 2 dependencies…${END}"
cat requirements/pip2.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read package; do
    echo "--> ${LYELLOW}${package}${END}…"
    pip2 install --upgrade --user $package
done

echo "==> ${LBLUE}Installing Python 3 dependencies…${END}"
cat requirements/pip3.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read package; do
    echo "--> ${LYELLOW}${package}${END}…"
    pip3 install --upgrade --user $package
done

echo "==> ${LBLUE}Installing Snap dependencies…${END}"
cat requirements/snap.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read package; do
    echo "--> ${LYELLOW}${package}${END}…"
    sudo snap install $package || sudo snap refresh $package
done

echo "==> ${LBLUE}Linking screen configuration…${END}"
linked $(pwd)/etc/screenrc ~/.screenrc

echo "==> ${LBLUE}Creating default directories…${END}"
directory ~/bin
directory ~/tmp
directory ~/Proyectos

echo "==> ${LBLUE}Linking scripts…${END}"
ls -1 bin/*.sh | while IFS= read file_path; do
    linked $(pwd)/${file_path} ~/bin/
done

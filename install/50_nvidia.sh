#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/colors.sh

if lspci | grep -q -i nvidia; then
    if [ ! -z "${TB_NVIDIA}" ]; then
        if grep --quiet '^ID=ubuntu' /etc/os-release; then
            if [ ! -f /etc/apt/sources.list.d/graphics-drivers-ubuntu-ppa-xenial.list ]; then
                echo "==> ${LBLUE}Adding Ubuntu graphics repository…${END}"
                sudo add-apt-repository -y ppa:graphics-drivers/ppa
                echo "==> ${LBLUE}Upgrading…${END}"
                sudo aptitude update && sudo aptitude safe-upgrade -y

            fi

            if [ -f /etc/apt/sources.list.d/nvidia-docker.list ]; then
                echo "==> ${LBLUE}Adding NVIDIA docker repository…${END}"
                curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
                  sudo apt-key add -
                distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
                curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
                  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
                sudo apt-get update

                if [ ! -z "${TB_RECOMMENDED_DRIVERS}" ]; then
                    echo "==> ${BROWN}Autoinstalling Ubuntu drivers!${END}"
                    sudo ubuntu-drivers autoinstall
                elif
                    echo "==> ${BROWN}Warning! Set \$TB_RECOMMENDED_DRIVERS to autoinstall drivers. Skipping!${END}"
                    echo "    Or run this by yourself: ${LRED}sudo ubuntu-drivers autoinstall${END}"
                fi

                echo "==> ${LBLUE}Installing NVIDIA docker…${END}"
                sudo apt-get install -y nvidia-docker2
                echo "==> ${LBLUE}Reload docker configuration…${END}"
                sudo pkill -SIGHUP dockerd
            fi
        fi

    else
        echo "==> ${BROWN}Warning! NVIDIA detected but \$TB_NVIDIA variable is not set. Skip install drivers!${END}"
    fi
fi

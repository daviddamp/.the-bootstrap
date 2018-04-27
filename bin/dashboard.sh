#!/usr/bin/env bash

set -e

cd "$(dirname "$(readlink -f "$0")")/.."

source lib/colors.sh
source lib/logo.sh

print_logo

echo "${DARKGRAY}"
printf $(uname -nmsr)
printf "${DARKGRAY} -- ${END}"
printf "${DARKGRAY}$(lsb_release -s -d) | $(lsb_release -s -r) $(lsb_release -s -c)${END}\n"
echo

# Ref: https://askubuntu.com/a/648200
# Ref: https://unix.stackexchange.com/a/119170
printf "${DARKGRAY}CPU load: ${LRED}$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) | awk -v RS="" '{printf "%.2f%%", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')%${END}"
printf "${DARKGRAY} -- ${END}"
free -m | awk "NR==2{printf \"${DARKGRAY}Memory usage: ${LRED}%s${DARKGRAY}/${LRED}%sMB${DARKGRAY} (${LRED}%.2f%%${DARKGRAY})${END}\", \$3,\$2,\$3*100/\$2 }"
printf "${DARKGRAY} -- ${END}"
df / -h | awk "\$NF==\"/\"{printf \"${DARKGRAY}Disk usage (root): ${LRED}%s${DARKGRAY}/${LRED}%s${DARKGRAY} (${LRED}%s${DARKGRAY})${END}\", \$3,\$2,\$5}"
printf "${DARKGRAY} -- ${END}"
df /home -h | awk "\$NF==\"/home\"{printf \"${DARKGRAY}Disk usage (home): ${LRED}%s${DARKGRAY}/${LRED}%s${DARKGRAY} (${LRED}%s${DARKGRAY})${END}\n\", \$3,\$2,\$5}"
echo

# Ref: http://nvidia.custhelp.com/app/answers/detail/a_id/3751/~/useful-nvidia-smi-queries
if command -v nvidia-smi &> /dev/null; then
    echo "${DARKGRAY}Nvidia GPUs (name, GPU, memory): ${LBLUE}"
    nvidia-smi --query-gpu=gpu_name,utilization.gpu,utilization.memory --format=csv | tail -n +2
    echo "${END}"
fi

bin/packt_offer.sh full
echo

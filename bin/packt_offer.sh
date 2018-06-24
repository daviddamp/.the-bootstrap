#!/usr/bin/env bash

set -e

TITLE_CACHE=/tmp/packt_offer.txt

if [ ! -f $TITLE_CACHE ] || [[ $(find "$TITLE_CACHE" -mmin +720 -print) ]]; then
    TITLE="“$(curl --silent 'https://www.packtpub.com/packt/offers/free-learning' | \
        xmllint --html --xmlout --nowarning --xpath '//div[@class="dotd-title"]/h2/text()' - 2>/dev/null | \
        grep -v -e '^[[:space:]]*$' | \
        sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')”"

    if [ "$TITLE" = "" ]; then
        printf "$TITLE" > $TITLE_CACHE
    fi
else
    TITLE=`cat $TITLE_CACHE`
fi

if [ "$TITLE" = "" ]; then
    if [ "$1" = "full" ]; then
        cd "$(dirname "$(readlink -f "$0")")/.."

        source lib/colors.sh

        echo "${DARKGRAY}Today's Packt free ebook: ${LBLUE}$(bin/packt_offer.sh)${DARKGRAY} (http://mkb.li/fJfY)${END}"
    else
        printf "$TITLE"
    fi
fi

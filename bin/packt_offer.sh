#!/usr/bin/env bash

set -e

TITLE_CACHE=/tmp/packt_offer.txt

if [ ! -f $TITLE_CACHE ] || [[ $(find "$TITLE_CACHE" -mtime +1 -print) ]]; then
    TITLE="“$(curl --silent 'https://www.packtpub.com/packt/offers/free-learning' | \
        xmllint --html --xmlout --nowarning --xpath '//div[@class="dotd-title"]/h2/text()' - 2>/dev/null | \
        grep -v -e '^[[:space:]]*$' | \
        sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')”"
    printf "$TITLE" > $TITLE_CACHE
else
    TITLE=`cat $TITLE_CACHE`
fi

printf "$TITLE"

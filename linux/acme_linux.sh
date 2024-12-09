#!/bin/bash

echo Script name: $0

if [ "$#" -ne 4 ]; then
        echo "Args are: <cmd> <domain> <hostname> <email>"
        echo "Where <cmd> is either 'issue' or 'renew'"
        echo "Example #1: $0 issue neverthere.org smaug.neverthere.org mhr@neverthere.org"
        echo "Example #2: $0 renew neverthere.org smaug.neverthere.org mhr@neverthere.org"
        exit 1
fi

CMD=$1
DOMAIN=$2
HOSTNAME=$3
EMAIL=$4

echo "Add CF_Token"
exit 1

export CF_Token=""
export CF_Email=$EMAIL

~/.acme.sh/acme.sh --register-account  -m $EMAIL --server zerossl
~/.acme.sh/acme.sh --server zerossl --issue -d $HOSTNAME --dns dns_cf
~/.acme.sh/acme.sh --force --issue --dns dns_cf -d $DOMAIN -d $HOSTNAME

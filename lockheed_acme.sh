#!/bin/bash

# https://dr-b.io/post/Synology-DSM-7-with-Lets-Encrypt-and-DNS-Challenge
#
if [ $# -ne 2 ]
        then
                echo "Need <file containing Cloudflare Token> and <password>"
                exit 1
fi

export CF_Token=$(<$1)
export SYNO_Username="sirius"
export SYNO_Password="$2"
export SYNO_Certificate="Let's Encrypt"
export SYNO_Create=1
sudo acme.sh \
        --cron \
        --force \
        --renew \
        --ocsp-must-staple \
        --keylength 4096 \
        -d lockheed.neverthere.org \
        --home $PWD

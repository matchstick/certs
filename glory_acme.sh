#!/bin/sh

if [ $# -ne 1 ]
	then
		echo "Need file containing Cloudflare Token"
		exit 1
fi

CF_Token=$(<$1)
acme.sh \
	--cron \
	--force \
	--renew \
	--ocsp-must-staple \
	--keylength 4096 \
	-d glory.neverthere.org \
	--home /home/mhr/cert

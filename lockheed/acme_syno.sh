#!/usr/bin/env sh

echo "Add env info first"
exit 1

export CF_Token=""
export CF_Email="mhr@neverthere.org"
export SYNO_PASSWORD=
export SYNO_USERNAME=

./acme.sh/acme.sh --register-account  -m mhr@neverthere.org --server zerossl
./acme.sh/acme.sh --server zerossl --issue -d lockheed.neverthere.org --dns dns_cf
./acme.sh/acme.sh --force --debug --issue --dns dns_cf -d neverthere.org -d 'lockheed.neverthere.org'
./acme.sh/acme.sh --deploy --deploy-hook synology_dsm -d lockheed.neverthere.org

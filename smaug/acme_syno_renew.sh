#!/usr/bin/env sh

export CF_Token=""
export CF_Email="mhr@neverthere.org"
export SYNO_PASSWORD=
export SYNO_USERNAME=

./.acme.sh/acme.sh --renew -d neverthere.org -d 'smaug.neverthere.org' --force --dns dns_cf --debug

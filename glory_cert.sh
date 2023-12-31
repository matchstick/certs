#!/bin/sh

certbot --config-dir=. --work-dir=. --logs-dir=. \
	--manual \
	--agree-tos \
	-d glory.neverthere.org \
	--preferred-challenges dns \
	certonly

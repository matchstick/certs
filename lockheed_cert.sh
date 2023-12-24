#!/bin/sh

certbot --config-dir=. --work-dir=. --logs-dir=. \
	--manual \
	--agree-tos \
	-d lockheed.neverthere.org \
	--preferred-challenges dns \
	certonly

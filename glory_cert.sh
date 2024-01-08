#!/bin/sh

certbot --config-dir=. --work-dir=. --logs-dir=. \
	--manual \
	--agree-tos \
	-d glory.neverthere.org \
	--preferred-challenges dns \
	certonly

# For Plex
# https://www.nodinrogers.com/post/2022-06-01-customer-ssl-cert-in-plex/
# openssl pkcs12 -export -out glory.neverthere.org.pfx -inkey ./privkey.pem -in ./cert.pem -name glory.neverthere.org -passout pass:""


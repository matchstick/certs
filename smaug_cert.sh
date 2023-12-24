#!/bin/sh

certbot --config-dir=. --work-dir=. --logs-dir=. certonly --manual -d smaug.neverthere.org --preferred-challenges dns

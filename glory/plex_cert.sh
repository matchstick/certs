#!/bin/bash -e

# We are not using a strong password for this ssl cert
# As this is just to secure it locall in the home for plex

if [ $# -ne 3 ]
	then
		echo "Need <input cert directory> and <output cert directory> <hostname>"
		exit 1
fi

CERTDIR="$1"
OUTDIR="$2"
HOSTNAME="$3"

echo $CERTDIR
echo $OUTDIR
echo $HOSTNAME

KEY="$CERTDIR/$HOSTNAME.key"
CERT="$CERTDIR/$HOSTNAME.cer"
CHAIN="$CERTDIR/fullchain.cer"
PFX="$OUTDIR/$HOSTNAME.pfx"

rm -f $PFX

sudo openssl pkcs12 \
	-export \
	-out $PFX \
	-inkey $KEY \
	-in $CERT \
	-name $HOSTNAME \
	-passout pass:""

sudo chown mhr:mhr $PFX
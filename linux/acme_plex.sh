#!/bin/bash

echo Script name: $0

if [ "$#" -ne 2 ]; then
        echo "Args are: <hostname> <plex config dir>"
        exit 1
fi

HOSTNAME=$1
PLEX_CFG_DIR=$2


CERTDIR="/home/$USER/.acme.sh/""$HOSTNAME""_ecc"

KEY="$CERTDIR/$HOSTNAME.key"
CERT="$CERTDIR/$HOSTNAME.cer"
CHAIN="$CERTDIR/fullchain.cer"
PFX="$CERTDIR/$HOSTNAME.pfx"

# We are not using a strong password for this ssl cert
echo Removing old pfx file
rm -f $PFX
openssl pkcs12 \
	-export -out $PFX -inkey $KEY -in $CERT -name $HOSTNAME -passout pass:""
echo Generated new pfx file
cp -f $PFX $PLEX_CFG_DIR
echo Copied new pfx file

echo DO NOT FORGET TO RESTART PLEX

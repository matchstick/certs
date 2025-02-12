#!/bin/bash

echo Script name: $0

if [ "$#" -ne 1 ]; then
        echo "Args are: <cfg file>"
        exit 1
fi


CFG=$1

# collect the variables in the config file
source $CFG

if [[ $? -ne 0 ]]; then
    echo "Error: Failed to source " $CFG >&2
    exit 1
fi

is_var_set() {
	local var_name="$1"
	if [ -n "${!var_name+x}" ]; then
		echo "Variable '$var_name' is set to '${!var_name}'"
	else
		echo "ERROR: '$var_name' must bet set in file $CFG"
		exit 1  # Failure: variable is unset
	fi
}

is_var_set "CERTDIR"
is_var_set "HOSTNAME"
is_var_set "PLEX_CFG_DIR"

KEY="$CERTDIR/$HOSTNAME.key"
CERT="$CERTDIR/$HOSTNAME.cer"
CHAIN="$CERTDIR/fullchain.cer"
PFX="$CERTDIR/$HOSTNAME.pfx"

# We are not using a strong password for this ssl cert
echo Removing old pfx file
rm -f $PFX

openssl pkcs12 \
	-export -out $PFX -inkey $KEY -in $CERT -name $HOSTNAME -passout pass:""
# Check the exit status
if [ $? -ne 0 ]; then
	echo "ERROR::openssl failed"
	exit 1
fi

echo Generated new pfx file
cp -f $PFX $PLEX_CFG_DIR
echo Copied new pfx file

echo DO NOT FORGET TO RESTART PLEX

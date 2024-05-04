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

KEY="$CERTDIR/$HOSTNAME.key"
CERT="$CERTDIR/$HOSTNAME.cer"
CHAIN="$CERTDIR/fullchain.cer"

sudo openssl pkcs12 \
	-passout pass: -passin pass:"" \
	-export \
	-out $OUTDIR/certificate.pfx \
	-inkey $KEY \
	-in $CERT \
	-certfile $CHAIN

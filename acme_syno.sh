#!/usr/bin/env sh

echo Script name: $0
if [ "$#" -ne 2 ]; then
	echo "Args are: <cmd> <cfg file>"
	echo "Where <cmd> is either 'issue' or 'renew'"
	echo "Example #1: $0 issue acme.cfg"
	echo "Example #2: $0 renew acme.cfg"
	exit 1
fi

CMD=$1
# collect the variables in the config file
source $2

is_var_set() {
  local var_name="$1"

  if [ -n "${!var_name+x}" ]; then
    echo "Variable '$var_name' is set to '${!var_name}'"
    return 0  # Success: variable is set
  else
    echo "Variable '$var_name' is not set"
    return 1  # Failure: variable is unset
  fi
}

is_var_set "DOMAIN"
is_var_set "HOSTNAME"
is_var_set "EMAIL"
is_var_set "CF_Token"
is_var_set "CF_Email"

if [ "$CMD" = "issue" ]; then
	./acme.sh/acme.sh --register-account  -m $EMAIL --server zerossl
	./acme.sh/acme.sh --server zerossl --issue -d $HOSTNAME --dns dns_cf
	./acme.sh/acme.sh --force --debug --issue --dns dns_cf -d $DOMAIN -d $HOSTNAME
	./acme.sh/acme.sh --deploy --deploy-hook synology_dsm -d $HOSTNAME
else
	./.acme.sh/acme.sh --renew -d $DOMAIN -d $HOSTNAME --force --dns dns_cf
fi

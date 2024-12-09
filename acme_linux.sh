#!/bin/bash

if [ "$#" -ne 2 ]; then
        echo "Args are: <cfg file>"
        echo "Where <cmd> is either 'issue' or 'renew'"
        echo "Example #1: $0 issue acme.cfg"
        exit 1
fi


CFG=$1

# collect the variables in the config file
source $CFG

is_var_set() {
	local var_name="$1"
	if [ -n "${!var_name+x}" ]; then
		echo "Variable '$var_name' is set to '${!var_name}'"
	else
		echo "ERROR: '$var_name' must bet set in file $CFG"
		exit 1  # Failure: variable is unset
	fi
}

is_var_set "DOMAIN"
is_var_set "HOSTNAME"
is_var_set "EMAIL"
is_var_set "CF_Token"
is_var_set "CF_Email"

~/.acme.sh/acme.sh --register-account  -m $EMAIL --server zerossl
~/.acme.sh/acme.sh --server zerossl --issue -d $HOSTNAME --dns dns_cf
~/.acme.sh/acme.sh --force --issue --dns dns_cf -d $DOMAIN -d $HOSTNAME

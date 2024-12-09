# certs

Routines for setting up TLS keys in the home.
Tired of relooking this up for home use.

I use Cloudflare to manage domains but acme docs are pretty easy for other DNS
handshakes.

# Basic Linux cert set up is here

No need for root. Just follow these steps:

1. Install acme
```
./acme.sh/acme.sh --install --nocron
```

## Install these scripts to generate certs using Cloudflare DNS
I wrote some simple bash to do this. I know I can make all of this one_
script that uses server as a parameter but right now I am lazy.

1. Grab this repo
```
git clone https://github.com/matchstick/certs
```

1. I got lazy and you will need to edit the acme_linux.sh script to add env variables for Cloudflare apis and Synology perms.

| env | value|
| --- | -----|
| CF_Token | Cloud Flare API Token |

1. Run ./certs/acme_linux.sh issue with proper arguments
1. Make sure that renewal is in the crontab it should be there automatically.
   But the script will do it by hand if you want.

# Plex certificate.

Another piece of documentation that drove me batty to remember is here.
First check out [this
site](https://gist.github.com/churro-s/fa3fdeb5cf10ebb251aa88338b8b37db) for the steps in the GUI and context.

Then all you need to do is when the cert is expired run *acme_plex.sh*. You can
autpmate this too pretty easily with cron.

# Synology steps are a bit more complicated

## Install acme.sh
1. Using GUI install git on synology in package manager "git server" this gets
   you git on the cli.
1. Using GUI enable ssh
1. Make sure your user has http and administrator privileges.
1. ssh to synology
1. Grab the acme sw
```
git clone https://github.com/acmesh-official/acme.sh
```
1. Install acme
```
./acme.sh/acme.sh --install --nocron
```

## Install these scripts to generate certs using Cloudflare DNS
I wrote some simple bash to do this. I know I can make all of this one 
script that uses server as a parameter but right now I am lazy.

1. Grab these synology scripts
```
git clone https://github.com/matchstick/certs
```
1. I got lazy and you will need to edit the acme_syno.sh script to add env variables for Cloudflare apis and Synology perms.

| env | value|
| --- | -----|
| CF_Token | Cloud Flare API Token |
| SYNO_PASSWORD| password for your synology accout |
| SYNO_USERNAME | usernname for the account you are installing with |

1. Run ./certs/acme_syno.sh issue with proper arguments
1. Add ./certs/acme_syno.sh renew as a command in the GUI for Task scheduler
1. Make sure to have output for task scheduler be set up.

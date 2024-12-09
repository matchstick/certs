# TLS and ACME certs for Synology and Plex

Routines for setting up TLS keys in the home.
Tired of relooking this up for home use.

I use Cloudflare to manage domains but acme docs are pretty easy for other DNS handshakes.

All of these scripts (except the plex one) use a cfg file. Example is
*acme.cfg*. Just a key value file to specify arguments to the scripts. They are
commented out by default and the scripts will let you know which ones they need.

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

1. Issue the cert
```
./certs/acme_linux.sh issue <path to cfg>
```

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
1. Issue the certs for synology

```
certs/acme_syno.sh issue <cfg file>
```

1. Add this command to the Task Scheduler in the GUI
```
certs/acme_syno.sh renew <cfg file>
```
1. Make sure to have output for task scheduler be set up.

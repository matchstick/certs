# certs

Routines for setting up TLS keys in the home.
Tired of relooking this up for home use.

I use Cloudflare to manage domains


*Synology steps are a bit more complicated.*


## Install acme.sh
1. Using GUI install git on synology in package manager "git server" this gets
   you git on the cli.
1. Using GUI enable ssh
1. Make sure your user has http and administrator privileges.
1. git clone https://github.com/acmesh-official/acme.sh

## Install scripts to generate certs using Cloudflare DNS
I wrote some simple bash to do this. I know I can make all of this one 
script that uses server as a parameter but right now I am lazy.

1. git clone https://github.com/matchstick/certs
1. mv certs/<server>/* ~/
1. Add env variables for Cloudflare apis to acme_syno.sh and acme_syno_renew.sh
1. Run ./acme_syno.sh
1. Add ./acme_syno_renew.sh as a comman in the GUI for Task scheduler
1. Make sure to have output for task scheduler be set up.
1.

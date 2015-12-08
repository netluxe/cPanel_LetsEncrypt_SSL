# A script for automatically getting and installing a letsencrypt key on a cPanel Server

## Installation
Letsencrypt must already be set up, via the instructions here:

https://forums.cpanel.net/threads/how-to-installing-ssl-from-lets-encrypt.513621/

Follow those instructions up to: "Generate an SSL"

Then switch to this script.

The root password must be set in installssl.pl (sorry)

## Usage

This script takes 2 arguments:

-p The path the files for the website are located
-d One or more domains to register the SSL for (the first should be the BARE DOMAIN if doing domain.com www.domain.com)

#### Example:

/root/ssl/install_ssl_single_domain.sh -d domain.com -d www.domain.com -p /home/domainuser/public_html

## CRON

This script can be run via cron. It is suggested to run it on a 60 day basis.

0 0 */60 * * /root/ssl/install_ssl_single_domain.sh -d domain.com -d www.domain.com -p /home/domainuser/public_html

## Credit

This is a wrapper for the script provided by cPanel here:

https://forums.cpanel.net/threads/how-to-installing-ssl-from-lets-encrypt.513621/

All credit goes to them!

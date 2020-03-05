


# cf_api_dns_delete.sh

This script does automated Cloudflare DNS deletes from a list and then records everything that is done in a log file.

It will remove both AAAA and A records if both are present

Orginal work

https://gist.github.com/benkulbertis/fff10759c2391b6618dd

Usage ./cf_api_dns_delete.sh input.txt

Use the this command to get configuration state before using

cf-terraforming --email 90XXXX@uwa.edu.au --key XXXXX -o fac2a27b5e50069cc3b1432bab93738d -z 8bc7b60c91f24998ff3d01d3838af694 all > uwa.edu.au.050320.tf

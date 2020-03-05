


# cf_api_dns_delete.sh

This script does automated Cloudflare DNS deletes from a list and then records everything that is done in a log file.

It will remove both AAAA and A records if both are present

Orginal work

https://gist.github.com/benkulbertis/fff10759c2391b6618dd

Usage ./cf_api_dns_delete.sh input.txt

Use  this command to get configuration state before using

cf-terraforming --email 90XXXX@xxx.edu.au --key XXXXX -o fac2a27b5e50xxxx432bab93738d -z 8bc7b60c91f24xxxxd01d3838af694 all > xxx.edu.au.050320.tf

# cf_grep_ip.sh

This script takes an IP address input file and a bind zone file. It searches through the bind file and iterates through the cname chains returning every name associated with an IP address. I used it with a port 80/443 scan to identify address's to name mappings for websites. Output is a csv file.

./cf_grep_ip.sh ip.txt bind.txt

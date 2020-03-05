#!/bin/bash

# CHANGE THESE
auth_email="90XXXXXX@uwa.edu.au"
auth_key="XXXXXXXXXXX"
zone_name="uwa.edu.au"
zone_identifier=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$zone_name" -H "X-Auth-Email: $auth_email" -H "X-Auth-Key: $auth_key" -H "Content-Type: application/json" | grep -Po '(?<="id":")[^"]*' | head -1 )

# MAYBE CHANGE THESE
log_file="cf_dns_delete.log"

# LOGGER
log() {
    if [ "$1" ]; then
        echo -e "[$(date)] - $1" >> $log_file
    fi
}

# SCRIPT START
log "Check Initiated"
for record_name in `cat $1` ;do

    record_id_string=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records?name=$record_name" -H "X-Auth-Email: $auth_email" -H "X-Auth-Key: $auth_key" -H "Content-Type: application/json"  | grep -Po '(?<="id":")[^"]*')

        for record_identifier in $record_id_string ;do
          delete=$(curl -s -X DELETE "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$record_identifier" -H "X-Auth-Email: $auth_email" -H "X-Auth-Key: $auth_key" -H "Content-Type: application/json")


if [[ $delete == *"\"success\":true"* ]]; then
    message="API DELETE SUCCESS"
    log "$message"
    log "$zone_name"
    log "$zone_identifier"
    log "$record_name"
    log "$record_identifier"
    echo "$message"
    echo "$record_name"
    echo "$delete"
else
    message="API DELETE FAILED. DUMPING RESULTS:\n$update"
    log "$message"
    echo -e "$message"
    exit 1
fi
      done
done

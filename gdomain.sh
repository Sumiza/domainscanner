#!/bin/bash

domainfile="domains"

function filter {
        if [ "$(echo "$line" | tr -dc '-')" = "" ]; then
                if [ "$(echo "$line" | tr -dc '0-9')" = "" ]; then
                        echo "Available: $line" >> odletters.log
                elif [ "$(echo "$line" | tr -dc 'A-z')" = "" ]; then
                        echo "Available: $line" >> odnumbers.log
                else
                        echo "Available: $line" >> odnodash.log
                fi
        else
                echo "Available: $line" >> oddash.log
        fi
}

cp "$domainfile" readfrom
sed -i 1,"$(wc -l alldomains.log | awk '{ print $1 }')"d readfrom

while read -r line; do
        check=$(curl -s -X GET "https://api.godaddy.com/v1/domains/available?domain=$line.com&checkType=FAST" \
                -H  "accept: application/json" \
                -H  "Authorization: sso-key GoDaddyuser:GoDaddyPass")
        if [ "$(echo "$check" | cut -d ':' -f 2 | cut -d ',' -f 1)" = "true" ]; then
                filter
                echo "Available: $line" >> opendomains.log
                echo "$check" >> alldomains.log
        else
                echo "$check" >> alldomains.log
        fi
        sleep 1.5
done < readfrom

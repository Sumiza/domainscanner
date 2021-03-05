#!/bin/bash


letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 -)

function whoischeck {

if [ "${domain:0:1}" != "-" ] && [ "${domain:3:1}" != "-" ]; then
        digging=$(dig @8.8.8.8 "$domain" any +short | head -n1)
        if [ "$digging" = "" ]; then
                isopen=$(whois "$1")
                ischeck=$(echo "$isopen" | grep 'No match for domain')
                if [ "$ischeck" ]; then
                        echo "$ischeck" >> alldomains.log
                        echo "$ischeck" >> opendomains.log
                else
                        isopen=$(echo "$isopen" | grep 'Registry Expiry Date' |  awk '{ print $1" "$2" "$3" "$4 }' )
                        echo "$isopen - $qw$er$ty$ui" >> alldomains.log
                fi
                sleep 5
        else
                echo "$digging : - $qw$er$ty$ui" >> alldomains.log
                sleep 0.5
        fi

fi
}
for qw in "${letters[@]}"; do
         for er in "${letters[@]}"; do
                 for ty in "${letters[@]}"; do
                         for ui in "${letters[@]}"; do
                                domain="$qw$er$ty$ui"".com"
                                whoischeck "$domain"
                         done
                 done
         done
done


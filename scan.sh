#!/bin/bash


letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 -)

function whoischeck {

if [ "${domain:0:1}" != "-" ] && [ "${domain:3:1}" != "-" ]; then
#     if [ "${domain:1:1}" = "-" ] && [ "${domain:2:1}" = "-" ]; then
        isopen=$(whois "$1")
        ischeck=$(echo "$isopen" | grep 'No match for domain')
        if [ "$ischeck" ]; then
                echo "$ischeck" >> log.log
                echo "$ischeck" >> open.log
        else
                isopen=$(echo "$isopen" | grep 'Registry Expiry Date' |  awk '{ print $1" "$2" "$3" "$4 }' )
                echo "$isopen - $qw$er$ty$ui" >> log.log
        fi
        sleep 10
#    fi
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

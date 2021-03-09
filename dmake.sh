#!/bin/bash
# generate all possible domains

letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 -)

function whoischeck {

if [ "${domain:0:1}" != "-" ] && [ "${domain:3:1}" != "-" ]; then
        echo "$domain" >> domains
fi
}
for qw in "${letters[@]}"; do
         for er in "${letters[@]}"; do
                 for ty in "${letters[@]}"; do
                         for ui in "${letters[@]}"; do
                                domain="$qw$er$ty$ui"
                                whoischeck "$domain"
                         done
                 done
         done
done

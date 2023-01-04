#!/bin/bash

logs=$1

echo "1. From which ip were the most requests? "
sleep 2
awk '{print $1}' $logs | sort | uniq -c | sort -r | awk '{print $2}' | head -1

echo "2. What is the most requested page?"
sleep 2
grep 'GET' $logs | awk '{print $6, $7, $8}' | sort | uniq -c | sort -r | head -1 | awk '{print $2 $3 $4}'

echo "3. How many requests were there from each ip?"
sleep 2
awk '{print $1}' $logs | sort | uniq -c | sort -k1 -r | awk '{print "Sum requests: " $1, " = ", $2}'

echo "4. What non-existent pages were clients referred to?"
sleep 2
grep 'error404' $logs | awk '{print $6, $7, $8}'

echo "5. What time did site get the most requests?"
sleep 2
awk '{print $4 }' $logs | sort | uniq -c | sort -r | awk '{print $2 }' | head

echo "6. What search bots have accessed the site? (UA + IP)"
sleep 2
awk '{print $1, $NF}' $logs | grep -E 'bot|bots' | grep -v 'robots' | sort -r | uniq 




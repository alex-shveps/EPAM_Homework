#!/bin/bash

echo "1. From which ip were the most requests? "
awk '{print $1}' apache_logs.txt | sort | uniq -c | sort -r | awk '{print $2}' | head -1

echo "2. What is the most requested page?"
grep '+http' apache_logs.txt | awk '{print $NF}' | sort | uniq -c | sort -r | awk '{print $2}' | head -1


echo "3. How many requests were there from each ip?"
awk '{print $1}' apache_logs.txt | sort | uniq -c | sort -k1 -r | awk '{print "Sum requests: " $1, " = ", $2}'

echo "4. What non-existent pages were clients referred to?"


echo "5. What time did site get the most requests?"


echo "6. What search bots have accessed the site? (UA + IP)"



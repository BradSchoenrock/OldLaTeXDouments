#!/bin/bash

for lis in $(ls | grep "html_Stats.txt" | cut -d "-" -f 1); do echo $lis; sum=0; for f in $(ls ${lis}*Stats.txt); do sum=$(echo "$(cat ${f} | grep mean | tr -s ' ' | cut -d ' ' -f 6)" + ${sum} | bc -l);done; echo $sum; sum=0; for f in $(ls ${lis}*Stats.txt); do sum=$( bc -l <<<" $(echo "$(cat ${f} | grep std | tr -s ' ' | cut -d ' ' -f 6)")*$(echo "$(cat ${f} | grep std | tr -s ' ' | cut -d ' ' -f 6)")");done; echo $(echo "scale=2;sqrt($sum)" | bc); done



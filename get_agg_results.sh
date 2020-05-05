#!/usr/bin/env bash

# Get find strategy with highest result for each pair
# and show number of number of pairs for each strategy

if [[ "$1" == "summary" ]]; then
  ./compare.py |grep -v skip | sort -nk1|awk {'print $4,$1,$3'} |sort -k2rn | sort -sbuk1,1|sort -nk2|awk {'print $NF'}|sort|uniq -c|sort -nk1
elif [[ "$1" == "2018" ]]; then
  ./compare.py |grep -v skip | sort -nk1|awk {'print $4,$1,$3'} |sort -k2rn | sort -sbuk1,1|sort -nk2|awk '{s+=$2} {print} END {print "TOTAL:",s}'
elif [[ "$1" == "2019" ]]; then
  ./compare.py |grep -v skip | sort -nk1|awk {'print $4,$2,$3'} |sort -k2rn | sort -sbuk1,1|sort -nk2|awk '{s+=$2} {print} END {print "TOTAL:",s}'
else
  echo "Usage: $0 [2018|2019|summary]"
fi



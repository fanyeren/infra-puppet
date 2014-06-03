#!/bin/bash
# MAINTAINED BY PUPPET. DO NOT MODIFY.
#
# Nagio check script to monitor the network interface usage
#
# units are GiB and if the usage yesterday goes beyond them it flags a problem
warn=$1
crit=$2

# capture the line that indicates the usage yesterday
# d;0 is today so far so it's not a reliable number
# d;1 is yesterday, d;2 is the day before, and so on
yesterday=$(vnstat --dumpdb | grep '^d;1;')

# transfer in MiB
rx=$(echo $yesterday | cut -f4 -d\;)
tx=$(echo $yesterday | cut -f5 -d\;)

# convert to GiB and compute total
rx=$(( $rx/1024 ))
tx=$(( $tx/1024 ))
total=$(( $tx+$rx ))

status="rx:${rx}GiB tx:${tx}GiB total:${total}GiB | rx=${rx},tx=${tx},total=${total}"

if (( $crit < $total )); then
  echo "CRITICAL - $status"
  exit 2
fi

if (( $warn < $total )); then
  echo "WARNING - $status"
  exit 1
fi

echo "OK - $status"
exit 0

#!/bin/bash
set -x
cpu_threshold=10
ram_threshold=10

cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
ram=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if [ $(echo "$cpu >= cpu_threshold" | bc) -eq 1 ] || [ $(echo "$ram >= $ram >= $ram_threshold" | bc) -eq 1 ]; then

subject="High cpu and RAM usage alert"
body="cpu Usage: $cpu%\nRam usage: $ram%"
echo -e "$body" | mail -s "$subject" rakeshkhopade12@gmail.com
fi

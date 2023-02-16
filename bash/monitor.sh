#!/bin/bash

# Define the threshold for the system load average
LOAD_THRESHOLD=2

# Define the email address to send alerts to
EMAIL_ADDRESS=youremail@example.com

# Get the current system load average
LOAD=$(uptime | awk '{print $10}' | cut -d "," -f 1)

# Check if the load average is above the threshold
if [ $(echo "$LOAD > $LOAD_THRESHOLD" | bc) -ne 0 ]; then
    # Send an email alert
    echo "System load average is $LOAD, which exceeds the threshold of $LOAD_THRESHOLD" | mail -s "System load alert" $EMAIL_ADDRESS
fi

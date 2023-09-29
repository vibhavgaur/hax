#!/bin/bash

# this file is stored at /usr/local/bin/steamlink-service-stopper.sh
# this script is run when the steamlink service is stopped
# this will look for a keypress and if the key is 'q', it will cancel the shutdown

echo Press the "q" key within 5 seconds to cancel shutdown

# Wait for a key press and read the input
read -t 5 -n 1 -s INPUT

# Check if the key is "q" (case-insensitive)
echo -n "$INPUT" | grep -iq "^q"

# If the key is "q", exit without executing the shutdown command
if [[ $? -eq 0 ]]; then
      echo "Shutdown cancelled"
      exit 0
fi

# If no key is pressed or the key is not "q", execute the shutdown command
sudo /usr/sbin/shutdown -h now


#!/bin/bash

# Specify the path to the SSH configuration file
ssh_config_file="/etc/ssh/sshd_config"

# Check if the SSH configuration file exists
if [ ! -f "$ssh_config_file" ]; then
  echo "SSH configuration file not found: $ssh_config_file"
  exit 1
fi

# Disable root SSH access
sed -i 's/PermitRootLogin yes/#PermitRootLogin yes/' "$ssh_config_file"

# Restart the SSH service
service ssh restart

echo "Root SSH access disabled."

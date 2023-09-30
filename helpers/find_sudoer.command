#!/bin/bash

for user in $(ls /Users); do
	# Use su to become the user and check if they can execute a sudo command
	if su - $user -c "sudo -l" 2>/dev/null | grep -q "ALL) ALL"; then
		echo $user
		break
	fi
done
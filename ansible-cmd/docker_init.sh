#!/bin/bash

# Copy the private keys here to workaround the issue of not being able to change permissions
# on files shared via Windows shares
echo "Copying private keys and changing permissions"
cp /private_keys/* /root/.ssh
chmod 700 /root/.ssh/*

# Spawn a new shell session so playbooks can be run interactively
/bin/bash
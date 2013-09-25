#!/bin/sh
#
# Script to add a new user on Debian/Ubuntu.
# To be run on tagret machine.

NEW_USER=elvis

sudo adduser "$NEW_USER"

sudo mkdir "/home/$NEW_USER/.ssh"
sudo nano "/home/$NEW_USER/.ssh/authorized_keys"

# Add SSH public key

sudo chown -R "$NEW_USER:$NEW_USER" "/home/$NEW_USER/.ssh"
sudo chmod -R go-rwx "/home/$NEW_USER/.ssh"

sudo usermod -a -G adm,admin "$NEW_USER"


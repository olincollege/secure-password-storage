#!/usr/bin/env bash

# Adding to startup:
# crontab -e
# @reboot sleep 5;/home/drew/Documents/github/secure-password-storage/monitor_passwords.sh

# dependencies:
# inotify-tools
# PASSWORDS_PATH=./

inotifywait -e close_write,moved_to,create -m . |
    while read -r directory events filename; do
        echo "working"
    done

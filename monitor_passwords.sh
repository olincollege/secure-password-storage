#!/usr/bin/env bash

# Adding to startup:
# crontab -e
# @reboot sleep 5;/home/drew/Documents/github/secure-password-storage/monitor_passwords.sh

# dependencies:
# inotify-tools
PASSWORDS_PATH=/home/drew/Desktop/Passwords.kdbx

inotifywait -m -e close_write "${PASSWORDS_PATH}" |
    while read -r filename event; do
        echo "working"
    done

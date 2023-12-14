#!/usr/bin/env bash

# Adding to startup:
# crontab -e
# @reboot sleep 5;/home/drew/Documents/github/secure-password-storage/monitor_passwords.sh

# dependencies:
# inotify-tools
PASSWORDS_PATH=./passwords/

monitor_directory() {
    inotifywait -e close_write,moved_to,create -m ${PASSWORDS_PATH} |
        while read -r directory events filename; do
            push_files
        done
}

push_files() {
    git push git@10.26.92.138:2222/home/git/passwords.git
    echo "working!"
}

monitor_directory

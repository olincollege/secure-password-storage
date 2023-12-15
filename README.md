# Secure Password Storage
Secure password database hosted on a personal server.

Lily Jiang, Aditi Vinod, Drew Pang

## Dependencies
Client devices:
* `inotify-tools` (handled in `client-setup.yml`)
* `cron` (should automatically come with an Ubuntu image)
* `git` (should be installed and user ssh should be set up manually)

Server:
* `ssh` (handled in `server_setup.yml`)
* `git` (handled in `server_setup.yml`)
* `docker` (requires manual installation)

## Set Up
Pre-Requisites: 1 server, at least 1 client.

Clone this repository onto the server and run  `server_setup.yml` to get started. Note that Ansible may have to be installed on the server.

On any client device, install git, sign into your user account, generate an SSH key, and then add the key to the server. Next, clone this repository and add `client-seteup.yml`. This will install the dependencies required for automating the pushing and pulling process; it also clones the server's hosted git repository and sets two cron jobs to continuously run and update the states of the remote and local passwords repository (attempt a push every 10 minutes, attempt a pull every 1 minute).

Once everything is set up, when working on a client device, you should be able to add a password to your "passwords" file. Any updates will soon be pushed to the server's hosted git repo (this occurs once every 10 minutes). Additionally, any updates from the server's repository will update your client device's "passwords" file (this occurs once every minute). Pulling from the repository is much more frequent in order to remain consistent with GitHub practices, where you must pull remote changes and merge everything locally before pushing. 

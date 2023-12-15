# secure-password-storage
Secure password database hosted on a personal server

Lily Jiang, Aditi Vinod, Drew Pang

## Dependencies
Client devices:
* `inotify-tools` (handled in `client-setup.yml`)
* `cron` (should automatically come with an Ubuntu image)
* `git` (should be installed and user ssh should be set up manually)

Server:
* `ssh` (handled in `server_setup.yml`)
* `git` (handled in `server_setup.yml`)
* `docker` (need to manually install)

## Set up
You should have 1 server, and at least 1 client.

On the server, clone this repo and run `server_setup.yml` to set everything up. Note that you might have to install Ansible as a prerequisite to this.

On any client devices, install git, sign into your user account, generate an SSH key, and then add this key to the server. Next, clone this repo and run `client-setup.yml`. This will install the dependencies needed for automated pushing and pulling. It also clones the server's hosted git repo, and sets two cron jobs to continuously run and update the states of the remote and local passwords repo (attempt a push every 10 minutes, attempt a pull every 1 minute)

Once you have everything set up, when you're working on your client device, you should be able to add a password to your passwords file. Your updates will soon be pushed to the server's hosted git repo (this occurs every 10 minutes). Additionally, any updates from the server's repo will update your client device's passwords file. This update ocurs every minute. Pulling from the repo is much more frequent as to follow normal github practices, where you must pull remote changes and merge everything locally before pushing.

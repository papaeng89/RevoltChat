This is still a work-in-progress and some things may not work but for the most part everything has been tested without issue!

## BE CARREFUL

The CI for the API server (revoltchat/server) is currently being reworked, I was having a few issues with building both amd64/arm64.

This version work on amd64 if you want work on arm64 ( for example : Raspberry PI 4 ) you need verify docker image for work on plateform arm64 

Please make sure you're using the correct image for your platform:
- amd64: `revoltchat/server:master`
- arm64: `revoltchat/server:latest`

I hope to get this resolved soon, thank you.

Related issue: https://github.com/revoltchat/delta/issues/116

## SETUP

Clone this repository.

```bash
git clone https://github.com/revoltchat/self-hosted revolt
cd revolt
```
chmod +x install.sh lib.sh


Modify variables in `install.sh` file and edit according to your needs.

export SERVICE_DOMAIN=**[DOMAIN NAME]**

export SERVICE_NAME=**[HOSTNAME]**

export SERVICE_IP=**[LOCAL ADDRESS IP]**

export LETSENCRYPT_MAIL=**[MAIL LETSENCRYPT]**

export PUBLIC_IP=**[PUBLIC ADDRESS IP]**

after, run ./install.sh

> ⚠️ This configuration works with letsencrypt certificat and https. 


## To-Do

- Interactive setup.
- Add Caddy.


Base on :
 - https://github.com/jim3692/self-hosted
 - https://github.com/revoltchat/self-hosted

This is still a work-in-progress and some things may not work but for the most part everything has been tested without issue!

## BE CARREFUL ##

The CI for the API server (revoltchat/server) is currently being reworked, I was having a few issues with building both amd64/arm64.

This version work on amd64 if you want work on arm64 ( for example : Raspberry PI 4 ) you need verify docker image for work on plateform arm64 

Please make sure you're using the correct image for your platform:
- amd64: `revoltchat/server:master`
- arm64: `revoltchat/server:latest`

I hope to get this resolved soon, thank you.

Related issue: https://github.com/revoltchat/delta/issues/116

## Setup

Clone this repository.

```bash
git clone https://github.com/revoltchat/self-hosted revolt
cd revolt
```
chmod +x install.sh lib.sh


Modify variables in `install.sh` file and edit according to your needs.

export SERVICE_DOMAIN=[DOMAIN NAME]
export SERVICE_NAME=[HOSTNAME]
export SERVICE_ADDRESS=$SERVICE_NAME.$SERVICE_DOMAIN
export SERVICE_IP=[LOCAL ADDRESS IP]
export LETSENCRYPT_MAIL=[MAIL LETSENCRYPT]
export PUBLIC_IP=[PUBLIC ADDRESS IP]



> ⚠️ The default configuration is intended for testing and only works on your local machine. If you want to deploy to a remote server, you need to edit the URLs in the `.env` file. \
> If you get a network error when trying to log in, **double check your configuration before opening an issue.**

```bash
cp .env.example .env
```

Then bring up REVOLT:

```bash
docker-compose up -d
```

## To-Do

- Interactive setup.
- Add Caddy.
- Add voso.

Base on :
 - https://github.com/jim3692/self-hosted
 - https://github.com/revoltchat/self-hosted

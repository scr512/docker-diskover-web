# docker-diskover-web
Diskover-web Docker image
# What's this?
This is a Docker image to stand up the web front-end of [Diskover](https://shirosaidev.github.io/diskover)
# How to get started
1. Git clone to desired host
```bash
mkdir ~/Docker
cd ~/Docker
git clone https://github.com/scr512/docker-diskover-web.git
```
2. Build image
```bash
docker build --no-cache -t scr512/docker-diskover-web ~/Docker/docker-diskover-web
```
3. Run
**ES_HOST must be set to your remote Elasticsearch host**
```bash
docker run -d --restart=always --name docker-diskover-web -p 8081:8081 -e ES_HOST=elasticsearch.domain.com scr512/docker-diskover-web
```
* Docker build example above assumes you always want the latest and greatest release of [diskover-web](https://github.com/shirosaidev/diskover-web)
# Other things
* Base image is using [Phusion base image](http://phusion.github.io/baseimage-docker)
* However I use supervisord rather than runit... It's a preference thing.

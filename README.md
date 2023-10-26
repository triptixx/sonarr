[hub]: https://hub.docker.com/r/loxoo/sonarr
[git]: https://github.com/triptixx/sonarr/tree/master
[actions]: https://github.com/triptixx/sonarr/actions/workflows/main.yml

# [loxoo/sonarr][hub]
[![Git Commit](https://img.shields.io/github/last-commit/triptixx/sonarr/master)][git]
[![Build Status](https://github.com/triptixx/sonarr/actions/workflows/main.yml/badge.svg?branch=master)][actions]
[![Latest Version](https://img.shields.io/docker/v/loxoo/sonarr/latest)][hub]
[![Size](https://img.shields.io/docker/image-size/loxoo/sonarr/latest)][hub]
[![Docker Stars](https://img.shields.io/docker/stars/loxoo/sonarr.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/loxoo/sonarr.svg)][hub]

## Usage

```shell
docker run -d \
    --name=srvsonarr \
    --restart=unless-stopped \
    --hostname=srvsonarr \
    -p 8989:8989 \
    -v $PWD/config:/config \
    -v $PWD/watchclient:/watch
    -v $PWD/downloadclient:/download \
    loxoo/sonarr
```

## Environment

- `$API_KEY`      - API Key authentication. _optional_
- `$ANALYTICS`    - Enable send Anonymous Usage Data. _default: `false`_
- `$BRANCH`       - Upstream tracking branch for updates. _default: `master`_
- `$ENABLE_SSL`   - Enable SSL. _default: `false`_
- `$LOG_LEVEL`    - Logging severity levels. _default: `info`_
- `$URL_BASE`     - URL Base configuration. _optional_
- `$SUID`         - User ID to run as. _default: `931`_
- `$SGID`         - Group ID to run as. _default: `900`_
- `$TZ`           - Timezone. _optional_

## Volume

- `/config`                - Server configuration file location.
- `/download/media`        - It must be created in the download folder of the downloader client, for sonarr hard links.

## Network

- `8989/tcp`      - WebUI.

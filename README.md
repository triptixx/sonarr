[hub]: https://hub.docker.com/r/loxoo/sonarr
[mbdg]: https://microbadger.com/images/loxoo/sonarr
[git]: https://github.com/triptixx/sonarr
[actions]: https://github.com/triptixx/sonarr/actions

# [loxoo/sonarr][hub]
[![Layers](https://images.microbadger.com/badges/image/loxoo/sonarr.svg)][mbdg]
[![Latest Version](https://images.microbadger.com/badges/version/loxoo/sonarr.svg)][hub]
[![Git Commit](https://images.microbadger.com/badges/commit/loxoo/sonarr.svg)][git]
[![Docker Stars](https://img.shields.io/docker/stars/loxoo/sonarr.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/loxoo/sonarr.svg)][hub]
[![Build Status](https://github.com/triptixx/sonarr/workflows/docker%20build/badge.svg)][actions]

## Usage

```shell
docker run -d \
    --name=srvsonarr \
    --restart=unless-stopped \
    --hostname=srvsonarr \
    -p 8989:8989 \
    -v $PWD/config:/config \
    loxoo/sonarr
```

## Environment

- `$SUID`         - User ID to run as. _default: `931`_
- `$SGID`         - Group ID to run as. _default: `931`_
- `$TZ`           - Timezone. _optional_

## Volume

- `/config`       - Server configuration file location.

## Network

- `8989/tcp`      - WebUI.

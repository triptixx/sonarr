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
- `/download/media`        - It must be created in the download folder of the downloader client, \
                             for sonarr hard links.

## Network

- `8989/tcp`      - WebUI.

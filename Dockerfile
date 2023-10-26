ARG ALPINE_TAG=3.18
ARG SONARR_VER=4.0.0.700

FROM loxoo/alpine:${ALPINE_TAG} AS builder

ARG SONARR_VER

### install sonarr
WORKDIR /output/sonarr
RUN wget -O- https://download.sonarr.tv/v4/develop/${SONARR_VER}/Sonarr.develop.${SONARR_VER}.linux-musl-x64.tar.gz \
        | tar xz --strip-components=1; \
    find . -name '*.mdb' -delete; \
    find ./UI -name '*.map' -delete; \
    rm -r Sonarr.Update

COPY *.sh /output/usr/local/bin/
RUN chmod +x /output/usr/local/bin/*.sh

#==============================================================

FROM loxoo/alpine:${ALPINE_TAG}

ARG SONARR_VER
ENV SUID=931 SGID=900

LABEL org.label-schema.name="sonarr" \
      org.label-schema.description="A Docker image for the TV management software Sonarr" \
      org.label-schema.url="https://sonarr.tv" \
      org.label-schema.version=${SONARR_VER}

COPY --from=builder /output/ /

RUN apk add --no-cache icu-libs sqlite-libs libmediainfo xmlstarlet

VOLUME ["/config"]

EXPOSE 8989/TCP

HEALTHCHECK --start-period=10s --timeout=5s \
    CMD wget -qO /dev/null 'http://localhost:8989/api/system/status' \
            --header "x-api-key: $(xmlstarlet sel -t -v '/Config/ApiKey' /config/config.xml)"

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
CMD ["/sonarr/Sonarr", "--no-browser", "--data=/config"]

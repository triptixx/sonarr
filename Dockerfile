ARG ALPINE_TAG=3.10
ARG MONO_TAG=5.20.1.19
ARG SONARR_VER=3.0.3.664

FROM loxoo/alpine:${ALPINE_TAG} AS builder

ARG SONARR_VER

### install sonarr
WORKDIR /output/sonarr
RUN wget -O- https://download.sonarr.tv/v3/phantom-develop/${SONARR_VER}/Sonarr.phantom-develop.${SONARR_VER}.linux.tar.gz \
        | tar xz --strip-components=1; \
    find . -name '*.mdb' -delete; \
    rm -r Sonarr.Update

COPY *.sh /output/usr/local/bin/
RUN chmod +x /output/usr/local/bin/*.sh

#=============================================================

FROM loxoo/mono-runtime:${MONO_TAG}

ARG SONARR_VER
ENV SUID=931 SGID=900

LABEL org.label-schema.name="sonarr" \
      org.label-schema.description="A Docker image for the TV management software Sonarr" \
      org.label-schema.url="https://sonarr.tv" \
      org.label-schema.version=${SONARR_VER}

COPY --from=builder /output/ /

RUN apk add --no-cache sqlite-libs libmediainfo xmlstarlet

VOLUME ["/config", "/medias"]

EXPOSE 8989/TCP

HEALTHCHECK --start-period=10s --timeout=5s \
    CMD wget -qO /dev/null 'http://localhost:8989/api/system/status' \
            --header "x-api-key: $(xmlstarlet sel -t -v '/Config/ApiKey' /config/config.xml)"

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
CMD ["mono", "/sonarr/Sonarr.exe", "--no-browser", "--data=/config"]

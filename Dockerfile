ARG BASE_IMAGE
ARG SR_LINUX_RELEASE
FROM $BASE_IMAGE:$SR_LINUX_RELEASE AS target-image

RUN sudo mkdir --mode=0755 -p /etc/opt/srlinux/appmgr/
COPY --chown=srlinux:srlinux ./ntp-server.yml /etc/opt/srlinux/appmgr
COPY ./src /opt/

ARG SRL_NTP_SERVER_RELEASE="[custom build]"
ENV SRL_NTP_SERVER_RELEASE=$SRL_NTP_SERVER_RELEASE

ARG BASE_IMAGE="ghcr.io/gbraad-devenv/fedora/rdesktop"
ARG BASE_VERSION=41

FROM ${BASE_IMAGE}:${BASE_VERSION}

USER root

RUN dnf install -y \
       libglvnd-opengl \
    && dnf clean all \
    && rm -rf /var/cache/yum \
    && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin \
    && git config -f /etc/rdesktop/rdesktop.ini \
       rdesktop.title "Personal Calibre" \
    && git config -f /etc/rdesktop/rdesktop.ini \
       rdesktop.exec "/opt/calibre/calibre"

# ensure to become root for systemd
#ENTRYPOINT ["/sbin/init"]

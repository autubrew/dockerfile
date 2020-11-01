FROM ubuntu:20.04
LABEL maintainer "Autubrew <violettime@foxmail.com>"

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update -y \
    && apt install --no-install-recommends -y \
        stress \
    && apt autoremove --purge -y \
    && apt autoclean -y \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/man/?? /usr/share/man/??_* /usr/share/man/??.* \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && find /usr/share/locale -mindepth 1 -maxdepth 1 ! -name 'en' -exec rm -rf {} +

ENTRYPOINT ["/usr/bin/stress"]
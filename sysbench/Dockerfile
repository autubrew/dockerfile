FROM ubuntu:18.04
LABEL maintainer "Autubrew <violettime@foxmail.com>"

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update -y \
    && apt install --no-install-recommends -y \
        curl \
	&& curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.deb.sh | bash \
	&& apt -y install sysbench \
    && apt autoremove --purge -y \
    && apt autoclean -y \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/*


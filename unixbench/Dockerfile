FROM ubuntu:20.04
LABEL maintainer "Autubrew <violettime@foxmail.com>"

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update -y \
    && apt install --no-install-recommends -y \
        wget build-essential gcc make perl \
    && mkdir -p /root \
    && cd root \
    && wget --no-check-certificate https://github.com/kdlucas/byte-unixbench/archive/v5.1.3.tar.gz -O byte-unixbench.tar.gz \
    && tar -zxf byte-unixbench.tar.gz -C /root --strip-components 1 \
    && chmod +x /root/UnixBench/Run \
    && rm byte-unixbench.tar.gz \
    && apt remove -y \
        wget \
    && apt autoremove --purge -y \
    && apt autoclean -y \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/UnixBench/

ENTRYPOINT ["/root/UnixBench/Run"]
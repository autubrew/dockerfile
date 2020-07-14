FROM ubuntu:18.04 AS build-env
LABEL maintainer "Autubrew <violettime@foxmail.com>"

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update -y \
    && apt install --no-install-recommends -y \
        bash-completion \
        ca-certificates \
        clang \
        cmake \
        make \
        wget \
        python3 \
    && mkdir -p /tmp \
    && cd /tmp \
    && wget -nv -O Bear.tar.gz https://github.com/rizsotto/Bear/archive/v2.4.3.tar.gz \
    && mkdir -p Bear \
    && tar zxvf Bear.tar.gz --strip-components=1 --directory=Bear \
    && cd Bear \
    && cmake . \
    && make all \
    && make install \
    && make check \
    && make package \
    && cd /tmp \
    && wget -nv -O woboq.deb https://download.opensuse.org/repositories/home:/pansenmann:/woboq/Debian_9.0/amd64/woboq-codebrowser_2.1_amd64.deb \
    && dpkg -i woboq.deb


FROM ubuntu:18.04

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update -y \
    && apt install --no-install-recommends -y \
        bc \
        bison \
        flex \
        gcc \
        libelf-dev \
        libssl-dev \
        make \
        python3 \
        wget \
        xz-utils \
    && apt-get autoremove --purge -y \
    && apt-get autoclean -y \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/man/?? /usr/share/man/??_* /usr/share/man/??.* \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && find /usr/share/locale -mindepth 1 -maxdepth 1 ! -name 'en' -exec rm -rf {} +

COPY --from=build-env ["/usr/bin/codebrowser_generator", "/usr/bin/codebrowser_indexgenerator", "/usr/bin/"]
COPY --from=build-env /usr/local/bin/bear /usr/local/bin
COPY --from=build-env /usr/local/lib/bear/libear.so /usr/local/lib/bear/libear.so
COPY --from=build-env /usr/share/woboq/data /usr/share/woboq/data
COPY data /usr/share/woboq/data
COPY entrypoint.sh /root

ENTRYPOINT [ "bash", "/root/entrypoint.sh" ]
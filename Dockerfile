FROM ubuntu:16.04

RUN sed -i "s@http://.*archive.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list \
    && sed -i "s@http://.*security.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list

USER root

COPY ./target/dst-admin.jar dst-admin.jar


ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai

RUN set -x \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests libstdc++6:i386 \
        libgcc1:i386 \
        lib32gcc1 \
        lib32stdc++6 \
        libcurl4-gnutls-dev:i386 \
        wget \
        ca-certificates \
        git \
        vim \
        openjdk-8-jdk \
        screen

RUN mkdir ~/steamcmd && mkdir -p ~/.klei/DoNotStarveTogether/MyDediServer \
    && cd ~/steamcmd && wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
    && tar -xvzf steamcmd_linux.tar.gz && ./steamcmd.sh +login anonymous +force_install_dir ~/dst +app_update 343050 validate +quit \
    && cp ~/steamcmd/linux32/libstdc++.so.6 ~/dst/bin/lib32/

EXPOSE 8080/tcp
EXPOSE 10888/udp
EXPOSE 10998/udp
EXPOSE 10999/udp
EXPOSE 27016/udp
EXPOSE 8767/udp

CMD ["mkdir","-p", "~/.klei/DoNotStarveTogether/MyDediServer"]
CMD ["nohup","java", "-jar", "-Xms250m", "-Xmx250m", "dst-admin.jar", "&"]

ARG RUN_USER=appusr
ARG TZ=America/Los_Angeles
FROM ubuntu:18.04
ARG RUN_USER
ARG TZ 
LABEL maintainer="Andrew Michaelis, amac@hyperplane.org" \
      description="This image definition is used to build a simple FireFox, \
        viber messaging and openssh client environment using ubuntu 18.04 as a base."

ENV DEBIAN_FRONTEND noninteractive
ENV LANG_WHICH en
ENV LANG_WHERE US
ENV ENCODING UTF-8

RUN apt-get update && \
    apt-get -y install \
      language-pack-en \
      dialog \
      locales \
      locales-all && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* && \
    apt-get -y clean

ENV LANGUAGE ${LANG_WHICH}_${LANG_WHERE}.${ENCODING}
ENV LANG ${LANGUAGE}
ENV LC_ALL ${LANGUAGE} 

RUN apt-get update && \
    locale-gen ${LANG_WHICH}_${LANG_WHERE} && \
    locale-gen ${LANGUAGE} && \
    apt-get -y install \
      readline-common \ 
      coreutils \
      apt-utils \ 
      tzdata && \
      ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime && \
      dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get -y install \
      ca-certificates \
      bash && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* && \
    apt-get -y clean

RUN apt-get update && \
    apt-get -y install \
      vorbis-tools \
      alsa-utils \
      libasound2 \
      libasound2-plugins \
      pulseaudio \
      pulseaudio-utils \
      vim \
      dbus-x11 \
      firefox

RUN useradd -m -c "Fire-Viber app user" ${RUN_USER}
#USER ${RUN_USER}

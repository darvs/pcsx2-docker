FROM ubuntu:bionic

ADD \
		https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz /tmp/

RUN \
		tar xzvf /tmp/s6-overlay-amd64.tar.gz -C /

RUN \
    apt update && \
    dpkg --add-architecture i386 && \
    apt install -y --no-install-recommends software-properties-common && \
    add-apt-repository multiverse && \
    add-apt-repository ppa:gregory-hainaut/pcsx2.official.ppa && \
    apt update && \
    apt install -y --no-install-recommends pcsx2

RUN \
	ln -s /usr/games/PCSX2 /usr/local/bin/PCSX2

RUN \
	apt install -y x11-apps mesa-utils pulseaudio && \
	sed -i "s/; enable-shm = yes/enable-shm = no/g" /etc/pulse/client.conf

RUN \
	DEBIAN_FRONTEND=noninteractive apt-get install -y locales && \
	sed -i -e 's/# \(en_US\.UTF-8 .*\)/\1/' /etc/locale.gen && \
  locale-gen

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8     

RUN \
	groupadd -g 1000 ubuntu && \
	useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu

USER ubuntu
WORKDIR /home/ubuntu

CMD PCSX2

# vim: ts=2 sw=2 et:

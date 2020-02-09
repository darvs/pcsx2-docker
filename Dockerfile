FROM i386/ubuntu:bionic

RUN \
    apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y software-properties-common libcap2-bin && \
    add-apt-repository ppa:pcsx2-team/pcsx2-daily && \
    apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y mesa-utils jstest-gtk pcsx2-unstable

RUN \
	DEBIAN_FRONTEND=noninteractive apt install -y pulseaudio && \
	sed -i "s/; enable-shm = yes/enable-shm = no/g" /etc/pulse/client.conf

RUN \
  apt install -y sudo && \
	ln -s /usr/games/PCSX2 /usr/local/bin/PCSX2 && \
  mkdir /app

RUN \
  DEBIAN_FRONTEND=noninteractive apt install -y locales && \
  sed -i -e 's/# \(en_US\.UTF-8 .*\)/\1/' /etc/locale.gen && \
  locale-gen

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8     

ADD bootstrap /app

RUN \
  chmod a+x /app/bootstrap

WORKDIR /app

CMD /app/bootstrap

# vim: ts=2 sw=2 et:

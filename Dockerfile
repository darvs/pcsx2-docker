FROM i386/ubuntu:bionic

#ADD \
		#https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz /tmp/

#RUN \
		#tar xzvf /tmp/s6-overlay-amd64.tar.gz -C /

#RUN \
    #apt update && \
    #dpkg --add-architecture i386 && \
    #apt install -y --no-install-recommends software-properties-common && \
    #add-apt-repository multiverse && \
    #add-apt-repository ppa:gregory-hainaut/pcsx2.official.ppa && \
    #apt update && \
    #apt install -y pcsx2
		#add-apt-repository ppa:oibaf/graphics-drivers && \
    #add-apt-repository multiverse && \
    #dpkg --add-architecture i386 && \
		#add-apt-repository ppa:oibaf/graphics-drivers && \

RUN \
    apt update && \
    apt install -y software-properties-common libcap2-bin && \
    add-apt-repository ppa:pcsx2-team/pcsx2-daily && \
    apt update && \
    apt install -y pcsx2-unstable

RUN \
	ln -s /usr/games/PCSX2 /usr/local/bin/PCSX2

RUN \
	apt install -y x11-apps mesa-utils pulseaudio && \
	sed -i "s/; enable-shm = yes/enable-shm = no/g" /etc/pulse/client.conf

RUN \
	DEBIAN_FRONTEND=noninteractive apt install -y locales && \
	sed -i -e 's/# \(en_US\.UTF-8 .*\)/\1/' /etc/locale.gen && \
  locale-gen

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8     

RUN \
  apt install -y sudo && \
  mkdir /app

RUN \
  apt install -y jstest-gtk 

RUN \
	apt install -y libsdl-image1.2-dev libsdl-dev

ADD bootstrap /app

RUN \
  chmod a+x /app/bootstrap

WORKDIR /app

CMD /app/bootstrap

# vim: ts=2 sw=2 et:

FROM debian:latest

LABEL maintainer="pixel@rageclic.fr" \
	  version=1.0 \
	  description="Create a server cs1.6"

RUN apt-get update \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y mailutils postfix curl wget file bzip2 gzip unzip binutils bsdmainutils python util-linux ca-certificates tmux lib32gcc1 libstdc++6 libstdc++6:i386 expect sudo

COPY ./*.* /

RUN chmod 755 /start.sh \
    && sed -i -e 's/\r$//' /start.sh \
    && useradd -ms /bin/bash csserver \
    && echo "csserver:csserver" | chpasswd && adduser csserver sudo

VOLUME /home/csserver

USER csserver

WORKDIR /home/csserver

EXPOSE 27015 27020 27005 27015/udp 27020/udp 27005/udp

CMD ["/start.sh"]
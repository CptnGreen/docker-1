# From a debian image you will add the appropriate sources 
# to create a TeamSpeak server, that will launch 
# along with your container. It will be deemed valid if at least
# one user can connect to it and engage in a 
# normal discussion (no far-fetched setup), so be sure to create 
# your Dockerfile with the right options. Your program should get 
# the sources when it builds, they cannot be in your repository.

FROM debian:buster

ENV TS_DIR=/opt/teamspeak

# install the latest teamspeak
RUN apt-get update &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -y bzip2 locales tini w3m wget && rm -rf /var/lib/apt/lists/* &&\
  wget https://files.teamspeak-services.com/releases/server/3.13.3/teamspeak3-server_linux_amd64-3.13.3.tar.bz2 -O /tmp/teamspeak.tar.bz2 &&\
  tar jxf /tmp/teamspeak.tar.bz2 -C /opt &&\
  mv /opt/teamspeak3-server_* ${TS_DIR} &&\
  rm /tmp/teamspeak.tar.bz2 &&\
  sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen &&\
  locale-gen &&\
  apt-get purge -y bzip2 w3m wget &&\
  apt-get autoremove -y &&\
  rm -rf /var/lib/apt/lists/*

# set the locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# create user, group, and set permissions
RUN groupadd -g 503 teamspeak &&\
  useradd -u 503 -g 503 -d ${TS_DIR} teamspeak &&\
  mkdir /data &&\
  chown -R teamspeak:teamspeak ${TS_DIR} /data

COPY entrypoint.sh /entrypoint.sh

USER teamspeak
EXPOSE 9987/udp 10011 30033 41144
ENTRYPOINT ["/entrypoint.sh"]
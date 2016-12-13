FROM resin/rpi-raspbian:jessie

# install java 8
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get update && apt-get install -y oracle-java8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# install ha-bridge
ENV VERSION 3.5.1
RUN mkdir /habridge
WORKDIR /habridge
RUN wget -O /habridge/app.jar https://github.com/bwssytems/ha-bridge/releases/download/v$VERSION/ha-bridge-$VERSION.jar

# start app
ENTRYPOINT [ "java", "-jar", "/habridge/app.jar" ]
CMD [ "-Dconfig.file", "/habridge/data/habridge.config" ]

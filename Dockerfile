FROM ubuntu:trusty

RUN apt-get update && apt-get upgrade -y

ADD http://repos.sensuapp.org/apt/pubkey.gpg /sensu_key.gpg
RUN apt-key add sensu_key.gpg
RUN echo "deb     http://repos.sensuapp.org/apt sensu main" >> /etc/apt/sources.list.d/sensu.list
RUN apt-get update && apt-get install -y sensu

CMD /opt/sensu/bin/sensu-server -d /etc/sensu/conf.d/

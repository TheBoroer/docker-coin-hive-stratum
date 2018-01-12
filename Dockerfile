FROM ubuntu:16.04

WORKDIR /coin-hive-stratum

ADD ./coin-hive-stratum/install.sh install.sh
RUN chmod 777 install.sh && ./install.sh

RUN source ~/.bashrc

CMD ["pm2","start","proxy.js","--name=proxy","--log-date-format='YYYY-MM-DD HH:mm'"]
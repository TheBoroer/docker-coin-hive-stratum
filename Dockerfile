FROM node:8

WORKDIR /stratum

RUN npm install -g pm2
RUN pm2 install pm2-logrotate
RUN npm init --yes
RUN npm install --save coin-hive-stratum

ADD ./proxy.js proxy.js

CMD ["pm2","start","/stratum/proxy.js","--name=proxy","--no-daemon","--log-date-format='YYYY-MM-DD HH:mm'"]
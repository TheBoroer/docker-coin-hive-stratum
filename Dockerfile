FROM ubuntu:16.04

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

WORKDIR /coin-hive-stratum

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.7/install.sh | bash
#RUN source ~/.nvm/nvm.sh

RUN nvm install 8
RUN npm install -g pm2
RUN pm2 install pm2-logrotate
RUN npm init --yes
RUN npm install --save coin-hive-stratum

RUN source ~/.bashrc

ADD ./proxy.js proxy.js

CMD ["pm2","start","proxy.js","--name=proxy","--log-date-format='YYYY-MM-DD HH:mm'"]
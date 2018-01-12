FROM ubuntu:16.04

WORKDIR /coin-hive-stratum

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.7/install.sh | bash
RUN echo 'export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' > ~/.profile

RUN nvm install 8
RUN npm install -g pm2
RUN pm2 install pm2-logrotate
RUN npm init --yes
RUN npm install --save coin-hive-stratum

RUN source ~/.bashrc

ADD ./proxy.js proxy.js

CMD ["pm2","start","proxy.js","--name=proxy","--log-date-format='YYYY-MM-DD HH:mm'"]
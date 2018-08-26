FROM mhart/alpine-node:latest
MAINTAINER uberjew666

ADD src/ /root/

RUN apk add --update unzip wget supervisor nano 

RUN mv /root/supervisord.conf /etc/supervisord.conf && \
	mkdir /app /config && \
	wget --no-check-certificate https://github.com/eamondo2/telegram-radarr-bot/archive/master.zip -P /app && \
	unzip /app/master.zip -d /app && \
	rm /app/master.zip

RUN cd /app/telegram-radarr-bot-master && npm install

RUN apk del unzip wget

VOLUME /config

CMD ["/bin/ash","/root/startup.sh"]
FROM alpine:3.15.3

ARG   RELEASE=0.3.16

ENV   CRON_PATH /etc/crontabs

RUN   mkdir /crontab-ui; touch $CRON_PATH/root; chmod +x $CRON_PATH/root

WORKDIR /crontab-ui

LABEL maintainer "@alseambusher"
LABEL description "Crontab-UI docker"

RUN   apk --no-cache add \
      wget \
      curl \
      nodejs \
      npm \
      supervisor \
      tzdata \
      unzip

RUN   wget https://github.com/alseambusher/crontab-ui/archive/refs/tags/v$RELEASE.zip
RUN   unzip v$RELEASE.zip
RUN   cp -r crontab-ui-$RELEASE/* /crontab-ui/

RUN   cp supervisord.conf /etc/supervisord.conf

RUN   npm install

ENV   HOST 0.0.0.0

ENV   PORT 8000

ENV   CRON_IN_DOCKER true

EXPOSE $PORT

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

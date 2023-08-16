FROM postgres:12-alpine3.17

RUN apk add --no-cache --virtual build-deps g++ make perl-dev tzdata openssh git curl perl-dbd-pg
RUN cpan App::cpanminus
RUN cpanm App::Sqitch --no-wget --notest --quiet
RUN rm -rf /root/.cpan

RUN apk add --no-cache perl perl-dbd-pg
RUN cp /usr/share/zoneinfo/UTC /etc/localtime
RUN echo UTC > /etc/timezone


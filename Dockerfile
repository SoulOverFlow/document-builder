FROM alpine:3.4
FROM mhart/alpine-node:6.3

MAINTAINER soulteary <soulteary@gmail.com>

USER root

RUN echo "Asia/Shanghai" > /etc/timezone

ENV MIRROR_URL https://mirror.tuna.tsinghua.edu.cn/alpine/

RUN echo '' > /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main"         >> /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/community"    >> /etc/apk/repositories && \
    echo '185.31.17.249 github.com'                                     >> /etc/hosts && \
    echo '166.111.206.63 mirror.tuna.tsinghua.edu.cn'                   >> /etc/hosts

RUN apk update --no-progress && apk upgrade --no-progress

# @ref https://hub.docker.com/r/bashell/alpine-bash/~/dockerfile/
RUN apk add bash
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd
ENV LC_ALL=en_US.UTF-8

RUN apk add git openssh perl

RUN mkdir -p /data/{website,docker} && mkdir -p /data/website/logs

WORKDIR /data/website

RUN npm install hexo-cli -g --registry=https://registry.npm.taobao.org \
    && hexo init . \
    && npm install --production \
    && npm install hexo-generator-sitemap --save \
    && npm install hexo-generator-feed --save

VOLUME ["/data/website/source", "/data/website/themes"]

RUN rm -rf /var/cache/apk/*

EXPOSE 80

COPY docker-entrypoint.sh /data/docker/docker-entrypoint.sh

ENTRYPOINT ["/data/docker/docker-entrypoint.sh"]

CMD hexo server -i 0.0.0.0 -p 80
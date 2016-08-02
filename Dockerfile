FROM soulteary/alpine-hexo:latest

MAINTAINER soulteary <soulteary@gmail.com>

USER root

WORKDIR /data/website

# ADD PATCH PLUGIN
COPY Website/plugin/ .
RUN npm install ./hexo-document-plugin/ --save --production --registry=https://registry.npm.taobao.org

# UPDATE DEPS.
COPY Website/package.json ./package-modify.json
COPY Website/bin/update-package.js .
RUN NEED_PATCH=true ./update-package.js

VOLUME ["/data/website/source", "/data/website/themes"]

EXPOSE 80

#COPY docker-entrypoint.sh /data/docker/docker-entrypoint.sh

#ENTRYPOINT ["/data/docker/docker-entrypoint.sh"]

#CMD hexo server -i 0.0.0.0 -p 80
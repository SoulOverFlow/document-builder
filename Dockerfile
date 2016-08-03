FROM soulteary/alpine-hexo:latest

MAINTAINER soulteary <soulteary@gmail.com>

USER root

### -- openresty
# https://github.com/quiklyn/docker-openresty
# https://openresty.org/#Download
ENV OPENRESTY_VERSION 1.9.15.1
# https://github.com/keplerproject/luarocks/wiki/Release-history
ENV LUAROCKS_VERSION 2.3.0

ENV OPENRESTY_PREFIX /usr/local/openresty
ENV NGINX_PREFIX ${OPENRESTY_PREFIX}/nginx
ENV LUAJIT_PREFIX ${OPENRESTY_PREFIX}/luajit

ENV PATH "${NGINX_PREFIX}/sbin:${LUAJIT_PREFIX}/bin:${OPENRESTY_PREFIX}/bin:${PATH}"

COPY ./docker-openresty-build.sh ./
RUN ./docker-openresty-build.sh

### --- openresty

WORKDIR /data/website

VOLUME ["/data/website/source", "/data/website/themes", "/data/website/posts"]

# PREPARE DIR
#RUN mkdir -p /data/website/posts/document && \
#    mkdir -p /data/website/posts/components

# ADD PATCH CONFIG.
COPY Website/package.json ./package-modify.json
COPY Website/bin/update-package.js .
COPY Website/bin/get-components-list.js .

# UPDATE CONFIG TO PACKAGE.JSON
RUN npm install story.md                --save --production --registry=https://registry.npm.taobao.org && \
    NEED_PATCH=true ./update-package.js

# ADD PATCH PLUGIN
COPY Website/plugin/ .
RUN npm install ./hexo-document-plugin/ --save --production --registry=https://registry.npm.taobao.org

COPY Website/themes/landscape/scripts/demobox.js /data/website/themes/landscape/scripts/demobox.js
COPY ./nginx.conf /usr/local/openresty/nginx/conf/

# CONVERT POST
CMD node_modules/.bin/note -c=./posts/document      --dist=./source/document && \
    node_modules/.bin/note -c=./posts/components    --dist=./source --transform-components && \
    ./get-components-list.js && \
    hexo generate && \
    nginx -g "daemon off; error_log logs/error.log info;"

EXPOSE 80

#CMD ["hexo generate","nginx -g daemon off; error_log logs/error.log info;"]

#COPY docker-entrypoint.sh /data/docker/docker-entrypoint.sh

#ENTRYPOINT ["/data/docker/docker-entrypoint.sh"]

#CMD hexo server -i 0.0.0.0 -p 80
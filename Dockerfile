FROM nginx:1.15.4-alpine

LABEL maintainer="hdfg159 <hdfg159@126.com>"

ENV BRANCH=master

RUN apk add --no-cache aria2 \
&& apk add --no-cache unzip \
&& apk add --no-cache wget \
&& wget https://github.com/ziahamza/webui-aria2/archive/$BRANCH.zip \
&& unzip $BRANCH.zip \
&& rm -rf $BRANCH.zip \
&& mv webui-aria2-$BRANCH/docs/*.* /usr/share/nginx/html/ \
&& rm -rf webui-aria2-$BRANCH \
&& apk del wget \
&& apk del unzip \
&& mkdir /root/.aria2 \
&& touch /root/.aria2/aria2.session

COPY aria2.conf /root/.aria2/aria2.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY start.sh /root/start.sh

RUN chmod 755 /root/start.sh

EXPOSE 6800
EXPOSE 80

CMD ["/root/start.sh"]
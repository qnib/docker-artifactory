FROM qnib/alpn-jre8

ENV ART_VER=4.7.0
RUN apk add --update curl \
 && curl -sLo /tmp/jfrog-artifactory-oss-${ART_VER}.zip http://ftp2.za.freebsd.org/pub/FreeBSD/ports/distfiles/jfrog-artifactory-oss-${ART_VER}.zip \
 && cd /opt/ \
 && unzip /tmp/jfrog-artifactory-oss-${ART_VER}.zip \
 && ln -s /opt/artifactory-oss-${ART_VER} /opt/artifactory-oss
ADD etc/supervisord.d/artifactory.ini /etc/supervisord.d/
ADD etc/consul.d/artifactory.json /etc/consul.d/


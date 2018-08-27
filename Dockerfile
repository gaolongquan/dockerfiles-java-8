FROM alpine

MAINTAINER glq <longquangao@gmail.com>

RUN cd /tmp                                                              && \
    echo -e "http://mirrors.aliyun.com/alpine/latest-stable/main\nhttp://mirrors.aliyun.com/alpine/latest-stable/community" > /etc/apk/repositories && \
#    apk update && \
    apk add --no-cache --virtual=build-dependencies ca-certificates wget tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    export LANG=en_US.UTF-8 && \
    export JAVA_URL="your url"                      && \
    export JAVA_HOME="/usr/lib/jvm/default-jvm"                          && \
    wget -q ${JAVA_URL}/glibc-2.26-r0.apk                            && \
    wget -q ${JAVA_URL}/glibc-bin-2.26-r0.apk                        && \
    wget -q ${JAVA_URL}/glibc-i18n-2.26-r0.apk                       && \
    apk add --no-cache --allow-untrusted glibc-2.26-r0.apk                    && \
    apk add --no-cache --allow-untrusted glibc-bin-2.26-r0.apk               && \
    apk add --no-cache --allow-untrusted glibc-i18n-2.26-r0.apk               && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /usr/lib/jvm                                                && \
    wget -qO- ${JAVA_URL}/jdk-8u171-linux-x64.tar.gz  | tar -xzf -  && \
    mv j* /usr/lib/jvm/java-8-oracle && \
    ln -s java-8-oracle $JAVA_HOME                                       && \
    rm -rf $JAVA_HOME/*src.zip                                           && \
    rm -rf \
            ${JAVA_HOME}/*/javaws \
            ${JAVA_HOME}/*/jjs \
            ${JAVA_HOME}/*/keytool \
            ${JAVA_HOME}/*/orbd \
            ${JAVA_HOME}/*/pack200 \
            ${JAVA_HOME}/*/policytool \
            ${JAVA_HOME}/*/rmid \
            ${JAVA_HOME}/*/rmiregistry \
            ${JAVA_HOME}/*/servertool \
            ${JAVA_HOME}/*/tnameserv \
            ${JAVA_HOME}/*/unpack200 \
            ${JAVA_HOME}/*/*javafx* \
            ${JAVA_HOME}/*/*jfx* \
            ${JAVA_HOME}/*/amd64/libdecora_sse.so \
            ${JAVA_HOME}/*/amd64/libfxplugins.so \
            ${JAVA_HOME}/*/amd64/libglass.so \
            ${JAVA_HOME}/*/amd64/libgstreamer-lite.so \
            ${JAVA_HOME}/*/amd64/libjavafx*.so \
            ${JAVA_HOME}/*/amd64/libjfx*.so \
            ${JAVA_HOME}/*/amd64/libprism_*.so \
            ${JAVA_HOME}/*/deploy* \
            ${JAVA_HOME}/*/desktop \
            ${JAVA_HOME}/*/ext/jfxrt.jar \
            ${JAVA_HOME}/*/ext/nashorn.jar \
            ${JAVA_HOME}/*/javaws.jar \
            ${JAVA_HOME}/*/jfr \
            ${JAVA_HOME}/*/jfr \
            ${JAVA_HOME}/*/jfr.jar \
            ${JAVA_HOME}/*/missioncontrol \
            ${JAVA_HOME}/*/oblique-fonts \
            ${JAVA_HOME}/*/plugin.jar \
            ${JAVA_HOME}/*/visualvm \
            ${JAVA_HOME}/man \
            ${JAVA_HOME}/plugin \
            ${JAVA_HOME}/*.txt \
            ${JAVA_HOME}/*/*/javaws \
            ${JAVA_HOME}/*/*/jjs \
            ${JAVA_HOME}/*/*/keytool \
            ${JAVA_HOME}/*/*/orbd \
            ${JAVA_HOME}/*/*/pack200 \
            ${JAVA_HOME}/*/*/policytool \
            ${JAVA_HOME}/*/*/rmid \
            ${JAVA_HOME}/*/*/rmiregistry \
            ${JAVA_HOME}/*/*/servertool \
            ${JAVA_HOME}/*/*/tnameserv \
            ${JAVA_HOME}/*/*/unpack200 \
            ${JAVA_HOME}/*/*/*javafx* \
            ${JAVA_HOME}/*/*/*jfx* \
            ${JAVA_HOME}/*/*/amd64/libdecora_sse.so \
            ${JAVA_HOME}/*/*/amd64/libfxplugins.so \
            ${JAVA_HOME}/*/*/amd64/libglass.so \
            ${JAVA_HOME}/*/*/amd64/libgstreamer-lite.so \
            ${JAVA_HOME}/*/*/amd64/libjavafx*.so \
            ${JAVA_HOME}/*/*/amd64/libjfx*.so \
            ${JAVA_HOME}/*/*/amd64/libprism_*.so \
            ${JAVA_HOME}/*/*/deploy* \
            ${JAVA_HOME}/*/*/desktop \
            ${JAVA_HOME}/*/*/ext/jfxrt.jar \
            ${JAVA_HOME}/*/*/ext/nashorn.jar \
            ${JAVA_HOME}/*/*/javaws.jar \
            ${JAVA_HOME}/*/*/jfr \
            ${JAVA_HOME}/*/*/jfr \
            ${JAVA_HOME}/*/*/jfr.jar \
            ${JAVA_HOME}/*/*/missioncontrol \
            ${JAVA_HOME}/*/*/oblique-fonts \
            ${JAVA_HOME}/*/*/plugin.jar \
            ${JAVA_HOME}/*/*/visualvm \
            ${JAVA_HOME}/*/man \
            ${JAVA_HOME}/*/plugin \
            ${JAVA_HOME}/*.txt \
                                                                         && \
    apk del build-dependencies                                           && \
    ln -s $JAVA_HOME/bin/* /usr/bin/                                     && \
    rm -rf /tmp/*

ENV JAVA_HOME=/usr/lib/jvm/default-jvm/ \
    PATH=${PATH}:/usr/lib/jvm/default-jvm/bin

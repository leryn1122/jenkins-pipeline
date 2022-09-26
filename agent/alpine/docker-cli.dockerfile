ARG version=4.11-1-alpine-jdk11
FROM jenkins/inbound-agent:${version} AS runtime

ARG version
ARG user=jenkins

USER root

RUN sed -i 's/https:\/\/dl-cdn.alpinelinux.org/http:\/\/mirrors.bfsu.edu.cn/g' /etc/apk/repositories \
      && \
    apk update && apk add \
      docker \
      && \
    rm -rf /var/cache/apk/*

USER ${user}

ENTRYPOINT [ "/usr/local/bin/jenkins-agent" ]
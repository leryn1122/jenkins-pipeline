ARG version=4.10-3-jdk11
FROM jenkins/inbound-agent:${version} AS runtime

USER root

RUN sed -i 's/deb.debian.org/mirrors.bfsu.edu.cn/g' /etc/apt/sources.list \
      &&
    apt-get update && apt-get install -y lsb-release curl \
      && \
    curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
      https://download.docker.com/linux/debian/gpg \
      && \
    echo "deb [arch=$(dpkg --print-architecture) \
          signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
          https://download.docker.com/linux/debian \
          $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
      && \
    apt-get update && apt-get install -y docker-ce-cli

USER jenkins

ENTRYPOINT [ "/usr/local/bin/jenkins-agent" ]
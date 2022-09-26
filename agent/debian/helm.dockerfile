ARG version=4.11-1-jdk11
FROM jenkins/inbound-agent:${version} AS runtime

ARG version
ARG user=jenkins
ARG github_proxy=https://ghproxy.com/

USER root

# https://helm.sh/docs/intro/install/#from-apt-debianubuntu
RUN sed -i 's/deb.debian.org/mirrors.bfsu.edu.cn/g' /etc/apt/sources.list \
      && \
    apt-get update && apt-get install -y apt-transport-https lsb-release curl gpg \
      && \
    curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null \
      && \
    echo "deb [arch=$(dpkg --print-architecture) \
          signed-by=/usr/share/keyrings/helm.gpg] \
          https://baltocdn.com/helm/stable/debian/ all main" | \
          tee /etc/apt/sources.list.d/helm-stable-debian.list \
      && \
    apt-get update && apt-get install -y \
      helm \
      && \
    apt-get clean \
      && \
    helm plugin install ${github_proxy}https://github.com/chartmuseum/helm-push.git && \
    mv /root/.cache /home/jenkins && \
    mv /root/.local /home/jenkins && \
    chown jenkins:jenkins /home/jenkins -R

USER ${user}

ENTRYPOINT [ "/usr/local/bin/jenkins-agent" ]
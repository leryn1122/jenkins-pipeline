ARG VERSION=3.10.0
FROM alpine/helm:${VERSION}

ARG GITHUB_PROXY=https://ghproxy.com/

RUN helm plugin install ${GITHUB_PROXY}https://github.com/chartmuseum/helm-push.git
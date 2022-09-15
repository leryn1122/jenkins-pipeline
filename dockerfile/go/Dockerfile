FROM golang:1.17 AS build

ENV GO111MODULE=on \
    GOPROXY=https://proxy.golang.com.cn

COPY . /opt

RUN apt-get update && apt-get install -y --no-install-recommends \
            make \
      && \
    apt-get autoremove -y && apt-get autoclean -y \
      && \
    rm -rf /var/lib/apt/lists/ \
      && \
    go mod tidy \
      && \
    make build

FROM debian:buster-slim AS publish

WORKDIR /opt

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates  \
        netbase \
      && \
    apt-get autoremove -y && apt-get autoclean -y \
      && \
    rm -rf /var/lib/apt/lists/

COPY --from=build /opt .

EXPOSE 8000/tcp

CMD ["./cmd", "-conf", "/data/conf"]

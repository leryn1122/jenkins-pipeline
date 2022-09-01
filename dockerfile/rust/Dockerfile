FROM rust:1.61-slim-buster AS build

WORKDIR /opt

COPY .cargo  ~

COPY .       .

RUN cargo build --release

FROM debian:buster-slim AS publish

WORKDIR  /

COPY docker-entrypoint.sh .

COPY --from=build /opt/release/ /usr/local/bin

RUN  ln -sf docker-entrypoint.sh entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
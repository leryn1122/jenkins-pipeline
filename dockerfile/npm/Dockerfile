FROM node:16-slim AS build

WORKDIR /opt

COPY .npmrc ~
RUN npm install pnpm -g

COPY package.json pnpm-lock.yaml .
RUN pnpm install

COPY . .
RUN pnpm build

FROM nginx:1.21.1 AS publish

WORKDIR /usr/share/nginx/html/

COPY ./nginx.conf  /etc/nginx/nginx.conf.d/app.conf
COPY --from=build  /opt/dist/   .

EXPOSE 80/tcp

ENTRYPOINT ["nginx", "-g", "daemon off;"]

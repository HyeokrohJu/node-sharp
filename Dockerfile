FROM node:18-alpine AS base

RUN apk add --no-cache libc6-compat

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /sharp

RUN yarn add sharp
  
RUN cd /sharp/node_modules/sharp \
  npm run install

CMD ["node"]
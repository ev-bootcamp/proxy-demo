FROM node:14.17.3-alpine3.14

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm ci
COPY ./index.js ./

EXPOSE 3000

CMD ["node","index.js"]

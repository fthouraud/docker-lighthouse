FROM node:10-alpine
RUN apk update && apk upgrade && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    apk add --no-cache \
      chromium@edge \
      nss@edge
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

RUN mkdir /lighthouse-results
WORKDIR /usr/src/app
COPY . .
RUN npm install

ENTRYPOINT ["node", "/usr/src/app/index.js"]

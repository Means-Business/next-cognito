ARG NODE_VERSION=10.8.0-alpine
FROM node:${NODE_VERSION} as dev
LABEL maintainer="manotlj@means-business.com"

WORKDIR /app

CMD ["sh", "-c", "npm install && npm run dev"]


FROM node:${NODE_VERSION} as prod
LABEL maintainer="manotlj@means-business.com"

# to ignore dirty node_modules
COPY . /app
WORKDIR /app

RUN ls -la

RUN npm install \
  && npm run build

CMD ["npm", "run", "start"]

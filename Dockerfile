FROM node:latest

RUN mkdir -p /home/node/app/ && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json yarn.lock ./

USER node

RUN yarn install

COPY --chown=node:node . .

RUN yarn build

CMD [ "yarn", "start" ]

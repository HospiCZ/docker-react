FROM node:16-alpine AS BUILDER
  
RUN mkdir -p /home/node/app
WORKDIR /home/node/app
 
COPY --chown=node:node ./package.json ./
RUN npm install

USER node

COPY --chown=node:node ./ ./
 
CMD ["npm", "start"]
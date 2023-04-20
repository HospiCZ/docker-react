FROM node:16-alpine AS BUILDER
  
RUN mkdir -p /home/node/app
WORKDIR /home/node/app
 
COPY --chown=node:node ./package.json ./
RUN npm install

COPY --chown=node:node ./ ./
RUN npm run build;

FROM nginx
EXPOSE 80
COPY --from=builder /app/build/ /usr/share/nginx/html
FROM node:16-buster-slim

COPY package*.json ./
RUN npm i
COPY server.js ./

EXPOSE 3000

CMD ["npm", "start"]

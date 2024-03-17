FROM node:latest


WORKDIR /usr/src/app

RUN pwd

COPY package*.json ./

RUN npm install

COPY . .

RUN ls -la

RUN npm run build

RUN pwd

RUN ls -la


EXPOSE 3000


CMD ["npm", "start"]


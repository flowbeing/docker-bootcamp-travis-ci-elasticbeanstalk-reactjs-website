FROM node:16-alpine AS source

WORKDIR /usr/docker-react-app

COPY package.json .

RUN npm install

COPY . .

CMD ["npm", "run", "build"]


FROM nginx:alpine

EXPOSE 80

COPY --from=source /usr/docker-react-app/build /usr/share/nginx

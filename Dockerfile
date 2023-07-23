#build phase
FROM node:latest AS build-stage

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

CMD ["npm", "run", "build"]

#run phase
FROM nginx

COPY --from=build-stage /app/build /usr/share/nginx/html

#CMD [ "executable" ] by default nginx container will auto start
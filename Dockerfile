# build react app
FROM node:lts-alpine

WORKDIR /app

COPY ./package.json .

RUN yarn

COPY . .

RUN yarn run build

# run nginx 
FROM nginx:stable-alpine

EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html

# nginx auto map static and run at port 80